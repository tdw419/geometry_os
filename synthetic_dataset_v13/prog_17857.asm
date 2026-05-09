; DESCRIPTION: Draws a black line from (102, 185) to (349, 4).
; PLAN: r0=102(x1), r1=185(y1), r2=349(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 185
LDI r2, 349
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
