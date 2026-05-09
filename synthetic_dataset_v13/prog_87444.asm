; DESCRIPTION: Places a green line segment connecting (52, 188) to (428, 176).
; PLAN: r0=52(x1), r1=188(y1), r2=428(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 188
LDI r2, 428
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
