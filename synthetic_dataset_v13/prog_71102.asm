; DESCRIPTION: Places a blue line segment connecting (229, 102) to (126, 6).
; PLAN: r0=229(x1), r1=102(y1), r2=126(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 102
LDI r2, 126
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
