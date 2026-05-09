; DESCRIPTION: Places a green line segment connecting (108, 102) to (274, 105).
; PLAN: r0=108(x1), r1=102(y1), r2=274(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 102
LDI r2, 274
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
