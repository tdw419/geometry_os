; DESCRIPTION: Composite: Sets a single orange pixel at (392, 220) then Draws a magenta rectangle at (334, 207) with width 68 and height 48 then Places a purple circle of radius 77 at center (141, 94).
; PLAN: r0=392(x), r1=220(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=207(y), r7=68(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=94(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 220
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 334
LDI r6, 207
LDI r7, 68
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 94
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
