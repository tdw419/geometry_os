; DESCRIPTION: Places a green line segment connecting (3, 80) to (63, 179).
; PLAN: r0=3(x1), r1=80(y1), r2=63(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 80
LDI r2, 63
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
