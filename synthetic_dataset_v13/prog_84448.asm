; DESCRIPTION: Places a green line segment connecting (297, 85) to (37, 231).
; PLAN: r0=297(x1), r1=85(y1), r2=37(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 85
LDI r2, 37
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
