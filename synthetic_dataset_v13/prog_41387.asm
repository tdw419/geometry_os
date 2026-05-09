; DESCRIPTION: Places a blue line segment connecting (105, 208) to (265, 175).
; PLAN: r0=105(x1), r1=208(y1), r2=265(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 208
LDI r2, 265
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
