; DESCRIPTION: Draws a black line from (61, 155) to (73, 76).
; PLAN: r0=61(x1), r1=155(y1), r2=73(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 155
LDI r2, 73
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
