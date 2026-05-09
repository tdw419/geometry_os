; DESCRIPTION: Places a white line segment connecting (399, 173) to (454, 136).
; PLAN: r0=399(x1), r1=173(y1), r2=454(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 173
LDI r2, 454
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
