; DESCRIPTION: Composite: Draws a green circle centered at (97, 92) with radius 74 then Places a magenta line segment connecting (11, 158) to (366, 65) then Places a green dot at position (195, 94).
; PLAN: r0=97(x), r1=92(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=158(y1), r7=366(x2), r8=65(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=94(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 92
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 158
LDI r7, 366
LDI r8, 65
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 94
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
