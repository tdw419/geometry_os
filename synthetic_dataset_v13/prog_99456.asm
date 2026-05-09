; DESCRIPTION: Places a green line segment connecting (509, 236) to (421, 218).
; PLAN: r0=509(x1), r1=236(y1), r2=421(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 236
LDI r2, 421
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
