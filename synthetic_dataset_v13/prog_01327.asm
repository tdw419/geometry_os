; DESCRIPTION: Composite: Sets a single orange pixel at (270, 6) then Draws a blue rectangle at (48, 106) with width 118 and height 30 then Draws a black circle centered at (401, 48) with radius 25.
; PLAN: r0=270(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=106(y), r7=118(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=48(y), r12=25(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 48
LDI r6, 106
LDI r7, 118
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 48
LDI r12, 25
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
