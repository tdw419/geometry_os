; DESCRIPTION: Places a blue line segment connecting (460, 26) to (216, 142).
; PLAN: r0=460(x1), r1=26(y1), r2=216(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 26
LDI r2, 216
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
