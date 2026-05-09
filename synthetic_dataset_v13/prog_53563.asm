; DESCRIPTION: Places a white line segment connecting (156, 188) to (326, 5).
; PLAN: r0=156(x1), r1=188(y1), r2=326(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 188
LDI r2, 326
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
