; DESCRIPTION: Composite: Draws a orange circle centered at (52, 215) with radius 36 then Places a white line segment connecting (130, 183) to (38, 81) then Places a blue dot at position (155, 255).
; PLAN: r0=52(x), r1=215(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=183(y1), r7=38(x2), r8=81(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=255(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 215
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 183
LDI r7, 38
LDI r8, 81
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 255
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
