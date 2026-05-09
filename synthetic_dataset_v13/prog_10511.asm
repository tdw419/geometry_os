; DESCRIPTION: Places a blue line segment connecting (74, 110) to (444, 38).
; PLAN: r0=74(x1), r1=110(y1), r2=444(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 110
LDI r2, 444
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
