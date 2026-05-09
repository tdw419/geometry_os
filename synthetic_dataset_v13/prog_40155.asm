; DESCRIPTION: Places a blue line segment connecting (39, 60) to (457, 166).
; PLAN: r0=39(x1), r1=60(y1), r2=457(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 60
LDI r2, 457
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
