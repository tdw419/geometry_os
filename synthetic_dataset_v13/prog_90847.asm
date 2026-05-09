; DESCRIPTION: Places a blue line segment connecting (33, 120) to (204, 102).
; PLAN: r0=33(x1), r1=120(y1), r2=204(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 120
LDI r2, 204
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
