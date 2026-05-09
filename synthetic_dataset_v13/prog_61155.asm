; DESCRIPTION: Places a blue line segment connecting (27, 54) to (66, 105).
; PLAN: r0=27(x1), r1=54(y1), r2=66(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 54
LDI r2, 66
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
