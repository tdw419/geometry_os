; DESCRIPTION: Places a blue line segment connecting (113, 203) to (90, 255).
; PLAN: r0=113(x1), r1=203(y1), r2=90(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 203
LDI r2, 90
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
