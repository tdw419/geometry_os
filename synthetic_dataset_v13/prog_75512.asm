; DESCRIPTION: Places a purple line segment connecting (421, 23) to (171, 7).
; PLAN: r0=421(x1), r1=23(y1), r2=171(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 23
LDI r2, 171
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
