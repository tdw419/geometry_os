; DESCRIPTION: Draws a black line from (149, 218) to (440, 227).
; PLAN: r0=149(x1), r1=218(y1), r2=440(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 218
LDI r2, 440
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
