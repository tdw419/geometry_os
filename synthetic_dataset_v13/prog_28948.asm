; DESCRIPTION: Places a white line segment connecting (504, 247) to (122, 102).
; PLAN: r0=504(x1), r1=247(y1), r2=122(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 247
LDI r2, 122
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
