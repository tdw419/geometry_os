; DESCRIPTION: Draws a black line from (297, 46) to (419, 237).
; PLAN: r0=297(x1), r1=46(y1), r2=419(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 46
LDI r2, 419
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
