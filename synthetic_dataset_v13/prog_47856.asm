; DESCRIPTION: Composite: Sets a single orange pixel at (249, 57) then Places a magenta 36x25 rectangle at position (65, 66) then Renders a blue disk with center (423, 115) and radius 15.
; PLAN: r0=249(x), r1=57(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=66(y), r7=36(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=115(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 57
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 65
LDI r6, 66
LDI r7, 36
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 115
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
