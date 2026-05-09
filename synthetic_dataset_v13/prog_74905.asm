; DESCRIPTION: Places a blue line segment connecting (250, 203) to (130, 177).
; PLAN: r0=250(x1), r1=203(y1), r2=130(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 203
LDI r2, 130
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
