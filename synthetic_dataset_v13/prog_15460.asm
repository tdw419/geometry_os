; DESCRIPTION: Places a orange line segment connecting (96, 157) to (187, 129).
; PLAN: r0=96(x1), r1=157(y1), r2=187(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 157
LDI r2, 187
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
