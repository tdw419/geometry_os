; DESCRIPTION: Places a white line segment connecting (29, 75) to (417, 181).
; PLAN: r0=29(x1), r1=75(y1), r2=417(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 75
LDI r2, 417
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
