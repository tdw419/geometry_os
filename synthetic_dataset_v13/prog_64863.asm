; DESCRIPTION: Places a green line segment connecting (32, 30) to (60, 179).
; PLAN: r0=32(x1), r1=30(y1), r2=60(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 30
LDI r2, 60
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
