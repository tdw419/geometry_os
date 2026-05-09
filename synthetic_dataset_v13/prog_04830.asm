; DESCRIPTION: Places a white line segment connecting (420, 86) to (452, 153).
; PLAN: r0=420(x1), r1=86(y1), r2=452(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 86
LDI r2, 452
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
