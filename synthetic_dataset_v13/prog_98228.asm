; DESCRIPTION: Places a orange line segment connecting (173, 172) to (269, 102).
; PLAN: r0=173(x1), r1=172(y1), r2=269(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 172
LDI r2, 269
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
