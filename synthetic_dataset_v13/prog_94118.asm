; DESCRIPTION: Places a white line segment connecting (366, 181) to (59, 18).
; PLAN: r0=366(x1), r1=181(y1), r2=59(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 181
LDI r2, 59
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
