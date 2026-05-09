; DESCRIPTION: Places a blue line segment connecting (6, 110) to (215, 188).
; PLAN: r0=6(x1), r1=110(y1), r2=215(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 110
LDI r2, 215
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
