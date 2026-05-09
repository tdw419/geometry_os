; DESCRIPTION: Places a white line segment connecting (141, 122) to (337, 183).
; PLAN: r0=141(x1), r1=122(y1), r2=337(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 122
LDI r2, 337
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
