; DESCRIPTION: Places a white line segment connecting (431, 76) to (214, 115).
; PLAN: r0=431(x1), r1=76(y1), r2=214(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 76
LDI r2, 214
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
