; DESCRIPTION: Places a white line segment connecting (297, 173) to (77, 123).
; PLAN: r0=297(x1), r1=173(y1), r2=77(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 173
LDI r2, 77
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
