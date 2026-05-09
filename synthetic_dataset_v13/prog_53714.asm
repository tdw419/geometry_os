; DESCRIPTION: Places a white line segment connecting (172, 244) to (123, 114).
; PLAN: r0=172(x1), r1=244(y1), r2=123(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 244
LDI r2, 123
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
