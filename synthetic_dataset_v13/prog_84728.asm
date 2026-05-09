; DESCRIPTION: Places a white line segment connecting (90, 93) to (355, 184).
; PLAN: r0=90(x1), r1=93(y1), r2=355(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 93
LDI r2, 355
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
