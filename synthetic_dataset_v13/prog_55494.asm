; DESCRIPTION: Places a white line segment connecting (297, 52) to (66, 168).
; PLAN: r0=297(x1), r1=52(y1), r2=66(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 52
LDI r2, 66
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
