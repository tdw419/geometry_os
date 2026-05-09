; DESCRIPTION: Composite: Creates a yellow circular shape at (267, 64) with radius 43 then Sets a single green pixel at (97, 123) then Renders a blue line between points (448, 255) and (377, 217).
; PLAN: r0=267(x), r1=64(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=123(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=448(x1), r11=255(y1), r12=377(x2), r13=217(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 64
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 123
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 448
LDI r11, 255
LDI r12, 377
LDI r13, 217
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
