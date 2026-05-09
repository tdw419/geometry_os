; DESCRIPTION: Places a blue line segment connecting (128, 161) to (428, 120).
; PLAN: r0=128(x1), r1=161(y1), r2=428(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 161
LDI r2, 428
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
