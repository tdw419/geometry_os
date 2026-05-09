; DESCRIPTION: Places a blue line segment connecting (467, 203) to (25, 134).
; PLAN: r0=467(x1), r1=203(y1), r2=25(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 203
LDI r2, 25
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
