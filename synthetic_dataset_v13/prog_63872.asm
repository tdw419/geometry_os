; DESCRIPTION: Places a orange line segment connecting (216, 254) to (412, 209).
; PLAN: r0=216(x1), r1=254(y1), r2=412(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 254
LDI r2, 412
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
