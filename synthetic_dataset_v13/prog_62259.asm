; DESCRIPTION: Draws a black line from (89, 102) to (58, 223).
; PLAN: r0=89(x1), r1=102(y1), r2=58(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 102
LDI r2, 58
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
