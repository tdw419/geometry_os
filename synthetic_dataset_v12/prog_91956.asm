; DESCRIPTION: Draws a green line from (160, 26) to (414, 227).
; PLAN: r0=160(x1), r1=26(y1), r2=414(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 26
LDI r2, 414
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
