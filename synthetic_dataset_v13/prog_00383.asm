; DESCRIPTION: Places a white line segment connecting (93, 240) to (161, 36).
; PLAN: r0=93(x1), r1=240(y1), r2=161(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 240
LDI r2, 161
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
