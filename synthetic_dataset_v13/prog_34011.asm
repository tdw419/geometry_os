; DESCRIPTION: Renders a black line between points (217, 193) and (328, 105).
; PLAN: r0=217(x1), r1=193(y1), r2=328(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 193
LDI r2, 328
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
