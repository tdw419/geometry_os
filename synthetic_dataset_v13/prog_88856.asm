; DESCRIPTION: Renders a purple line between points (175, 251) and (402, 214).
; PLAN: r0=175(x1), r1=251(y1), r2=402(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 251
LDI r2, 402
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
