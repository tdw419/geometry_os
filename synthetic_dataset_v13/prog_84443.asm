; DESCRIPTION: Places a blue line segment connecting (460, 217) to (150, 35).
; PLAN: r0=460(x1), r1=217(y1), r2=150(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 217
LDI r2, 150
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
