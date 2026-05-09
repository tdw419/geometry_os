; DESCRIPTION: Draws a black line from (349, 80) to (33, 19).
; PLAN: r0=349(x1), r1=80(y1), r2=33(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 80
LDI r2, 33
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
