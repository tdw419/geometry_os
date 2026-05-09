; DESCRIPTION: Places a blue line segment connecting (509, 87) to (13, 144).
; PLAN: r0=509(x1), r1=87(y1), r2=13(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 87
LDI r2, 13
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
