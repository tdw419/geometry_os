; DESCRIPTION: Places a purple line segment connecting (462, 148) to (242, 247).
; PLAN: r0=462(x1), r1=148(y1), r2=242(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 148
LDI r2, 242
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
