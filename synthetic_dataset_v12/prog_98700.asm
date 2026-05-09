; DESCRIPTION: Places a blue line segment connecting (510, 105) to (288, 167).
; PLAN: r0=510(x1), r1=105(y1), r2=288(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 105
LDI r2, 288
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
