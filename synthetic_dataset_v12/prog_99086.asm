; DESCRIPTION: Renders a black line between points (427, 14) and (198, 87).
; PLAN: r0=427(x1), r1=14(y1), r2=198(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 14
LDI r2, 198
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
