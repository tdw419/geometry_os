; DESCRIPTION: Places a blue line segment connecting (343, 184) to (509, 115).
; PLAN: r0=343(x1), r1=184(y1), r2=509(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 184
LDI r2, 509
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
