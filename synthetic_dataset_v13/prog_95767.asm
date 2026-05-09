; DESCRIPTION: Places a white line segment connecting (476, 62) to (234, 68).
; PLAN: r0=476(x1), r1=62(y1), r2=234(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 62
LDI r2, 234
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
