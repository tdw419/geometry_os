; DESCRIPTION: Places a blue line segment connecting (247, 97) to (59, 200).
; PLAN: r0=247(x1), r1=97(y1), r2=59(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 97
LDI r2, 59
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
