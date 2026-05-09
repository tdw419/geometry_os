; DESCRIPTION: Draws a black line from (145, 94) to (462, 218).
; PLAN: r0=145(x1), r1=94(y1), r2=462(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 94
LDI r2, 462
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
