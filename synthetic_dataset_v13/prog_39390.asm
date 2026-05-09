; DESCRIPTION: Places a white line segment connecting (3, 102) to (424, 88).
; PLAN: r0=3(x1), r1=102(y1), r2=424(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 102
LDI r2, 424
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
