; DESCRIPTION: Places a blue line segment connecting (138, 88) to (75, 126).
; PLAN: r0=138(x1), r1=88(y1), r2=75(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 88
LDI r2, 75
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
