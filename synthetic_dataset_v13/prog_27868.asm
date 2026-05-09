; DESCRIPTION: Places a white line segment connecting (299, 101) to (329, 163).
; PLAN: r0=299(x1), r1=101(y1), r2=329(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 101
LDI r2, 329
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
