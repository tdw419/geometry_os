; DESCRIPTION: Places a purple line segment connecting (18, 148) to (338, 242).
; PLAN: r0=18(x1), r1=148(y1), r2=338(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 148
LDI r2, 338
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
