; DESCRIPTION: Places a blue line segment connecting (202, 47) to (505, 4).
; PLAN: r0=202(x1), r1=47(y1), r2=505(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 47
LDI r2, 505
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
