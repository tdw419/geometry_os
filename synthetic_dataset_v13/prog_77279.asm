; DESCRIPTION: Places a black line segment connecting (153, 124) to (337, 123).
; PLAN: r0=153(x1), r1=124(y1), r2=337(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 124
LDI r2, 337
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
