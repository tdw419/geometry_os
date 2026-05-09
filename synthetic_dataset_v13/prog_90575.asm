; DESCRIPTION: Places a blue line segment connecting (366, 0) to (346, 102).
; PLAN: r0=366(x1), r1=0(y1), r2=346(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 0
LDI r2, 346
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
