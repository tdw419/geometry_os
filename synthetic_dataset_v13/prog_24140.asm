; DESCRIPTION: Places a orange line segment connecting (58, 130) to (206, 172).
; PLAN: r0=58(x1), r1=130(y1), r2=206(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 130
LDI r2, 206
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
