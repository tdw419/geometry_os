; DESCRIPTION: Places a white line segment connecting (22, 157) to (504, 159).
; PLAN: r0=22(x1), r1=157(y1), r2=504(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 157
LDI r2, 504
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
