; DESCRIPTION: Places a green line segment connecting (148, 234) to (453, 247).
; PLAN: r0=148(x1), r1=234(y1), r2=453(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 234
LDI r2, 453
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
