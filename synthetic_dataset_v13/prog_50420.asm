; DESCRIPTION: Places a white line segment connecting (173, 184) to (457, 31).
; PLAN: r0=173(x1), r1=184(y1), r2=457(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 184
LDI r2, 457
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
