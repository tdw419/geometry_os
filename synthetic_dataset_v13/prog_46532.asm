; DESCRIPTION: Places a magenta line segment connecting (128, 47) to (484, 14).
; PLAN: r0=128(x1), r1=47(y1), r2=484(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 47
LDI r2, 484
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
