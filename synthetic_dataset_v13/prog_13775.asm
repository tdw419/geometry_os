; DESCRIPTION: Places a white line segment connecting (24, 232) to (308, 16).
; PLAN: r0=24(x1), r1=232(y1), r2=308(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 232
LDI r2, 308
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
