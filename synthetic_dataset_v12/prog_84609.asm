; DESCRIPTION: Places a white line segment connecting (322, 78) to (175, 216).
; PLAN: r0=322(x1), r1=78(y1), r2=175(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 78
LDI r2, 175
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
