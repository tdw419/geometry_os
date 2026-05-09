; DESCRIPTION: Places a blue line segment connecting (310, 39) to (341, 102).
; PLAN: r0=310(x1), r1=39(y1), r2=341(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 39
LDI r2, 341
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
