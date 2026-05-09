; DESCRIPTION: Places a green line segment connecting (70, 95) to (448, 69).
; PLAN: r0=70(x1), r1=95(y1), r2=448(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 95
LDI r2, 448
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
