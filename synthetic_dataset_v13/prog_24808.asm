; DESCRIPTION: Composite: Draws a magenta line from (389, 26) to (133, 192) then Renders a white disk with center (197, 183) and radius 45 then Sets a single white pixel at (439, 114).
; PLAN: r0=389(x1), r1=26(y1), r2=133(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=183(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=114(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 26
LDI r2, 133
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 183
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 114
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
