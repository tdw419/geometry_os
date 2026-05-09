; DESCRIPTION: Places a blue line segment connecting (509, 234) to (421, 99).
; PLAN: r0=509(x1), r1=234(y1), r2=421(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 234
LDI r2, 421
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
