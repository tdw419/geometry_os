; DESCRIPTION: Composite: Draws a white line from (220, 77) to (137, 70) then Sets a single magenta pixel at (377, 230) then Renders a purple disk with center (252, 179) and radius 66.
; PLAN: r0=220(x1), r1=77(y1), r2=137(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=179(y), r12=66(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 77
LDI r2, 137
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 179
LDI r12, 66
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
