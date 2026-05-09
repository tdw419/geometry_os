; DESCRIPTION: Places a blue line segment connecting (289, 117) to (33, 102).
; PLAN: r0=289(x1), r1=117(y1), r2=33(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 117
LDI r2, 33
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
