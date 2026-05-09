; DESCRIPTION: Places a blue line segment connecting (241, 35) to (270, 203).
; PLAN: r0=241(x1), r1=35(y1), r2=270(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 35
LDI r2, 270
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
