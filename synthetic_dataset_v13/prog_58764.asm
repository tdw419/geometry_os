; DESCRIPTION: Places a white line segment connecting (258, 32) to (149, 138).
; PLAN: r0=258(x1), r1=32(y1), r2=149(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 32
LDI r2, 149
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
