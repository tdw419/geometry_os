; DESCRIPTION: Draws a black line from (414, 140) to (56, 229).
; PLAN: r0=414(x1), r1=140(y1), r2=56(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 140
LDI r2, 56
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
