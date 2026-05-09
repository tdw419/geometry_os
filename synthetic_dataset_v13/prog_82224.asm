; DESCRIPTION: Places a green line segment connecting (390, 20) to (392, 179).
; PLAN: r0=390(x1), r1=20(y1), r2=392(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 20
LDI r2, 392
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
