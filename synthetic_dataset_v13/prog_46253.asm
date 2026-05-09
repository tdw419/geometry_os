; DESCRIPTION: Places a black line segment connecting (388, 114) to (135, 139).
; PLAN: r0=388(x1), r1=114(y1), r2=135(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 114
LDI r2, 135
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
