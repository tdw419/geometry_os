; DESCRIPTION: Draws a black line from (77, 101) to (349, 33).
; PLAN: r0=77(x1), r1=101(y1), r2=349(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 101
LDI r2, 349
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
