; DESCRIPTION: Composite: Draws a purple line from (10, 63) to (341, 218) then Places a white circle of radius 20 at center (309, 104) then Places a green dot at position (261, 85).
; PLAN: r0=10(x1), r1=63(y1), r2=341(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=104(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=85(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 10
LDI r1, 63
LDI r2, 341
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 104
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 85
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
