; DESCRIPTION: Places a white line segment connecting (505, 217) to (282, 172).
; PLAN: r0=505(x1), r1=217(y1), r2=282(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 217
LDI r2, 282
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
