; DESCRIPTION: Places a blue line segment connecting (105, 237) to (445, 34).
; PLAN: r0=105(x1), r1=237(y1), r2=445(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 237
LDI r2, 445
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
