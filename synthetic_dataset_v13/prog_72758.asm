; DESCRIPTION: Draws a black line from (377, 38) to (112, 5).
; PLAN: r0=377(x1), r1=38(y1), r2=112(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 38
LDI r2, 112
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
