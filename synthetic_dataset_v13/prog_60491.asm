; DESCRIPTION: Places a white line segment connecting (173, 64) to (282, 78).
; PLAN: r0=173(x1), r1=64(y1), r2=282(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 64
LDI r2, 282
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
