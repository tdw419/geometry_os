; DESCRIPTION: Places a white line segment connecting (390, 176) to (173, 81).
; PLAN: r0=390(x1), r1=176(y1), r2=173(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 176
LDI r2, 173
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
