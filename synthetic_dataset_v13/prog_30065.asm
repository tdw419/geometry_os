; DESCRIPTION: Places a blue line segment connecting (30, 192) to (445, 47).
; PLAN: r0=30(x1), r1=192(y1), r2=445(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 192
LDI r2, 445
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
