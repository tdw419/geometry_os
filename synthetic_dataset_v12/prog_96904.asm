; DESCRIPTION: Places a orange line segment connecting (373, 172) to (153, 171).
; PLAN: r0=373(x1), r1=172(y1), r2=153(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 172
LDI r2, 153
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
