; DESCRIPTION: Places a white line segment connecting (326, 93) to (472, 75).
; PLAN: r0=326(x1), r1=93(y1), r2=472(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 93
LDI r2, 472
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
