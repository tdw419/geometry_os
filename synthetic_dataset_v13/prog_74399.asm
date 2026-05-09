; DESCRIPTION: Places a green line segment connecting (414, 46) to (444, 212).
; PLAN: r0=414(x1), r1=46(y1), r2=444(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 46
LDI r2, 444
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
