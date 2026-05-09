; DESCRIPTION: Places a white line segment connecting (238, 193) to (452, 176).
; PLAN: r0=238(x1), r1=193(y1), r2=452(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 193
LDI r2, 452
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
