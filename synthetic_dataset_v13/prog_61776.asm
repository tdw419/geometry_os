; DESCRIPTION: Places a blue line segment connecting (445, 203) to (436, 83).
; PLAN: r0=445(x1), r1=203(y1), r2=436(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 203
LDI r2, 436
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
