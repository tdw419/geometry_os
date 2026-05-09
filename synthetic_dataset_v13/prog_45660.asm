; DESCRIPTION: Places a green line segment connecting (141, 151) to (421, 181).
; PLAN: r0=141(x1), r1=151(y1), r2=421(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 151
LDI r2, 421
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
