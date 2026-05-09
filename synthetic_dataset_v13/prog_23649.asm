; DESCRIPTION: Draws a black line from (211, 76) to (142, 96).
; PLAN: r0=211(x1), r1=76(y1), r2=142(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 76
LDI r2, 142
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
