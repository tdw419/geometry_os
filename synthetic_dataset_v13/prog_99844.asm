; DESCRIPTION: Places a blue line segment connecting (160, 143) to (92, 203).
; PLAN: r0=160(x1), r1=143(y1), r2=92(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 143
LDI r2, 92
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
