; DESCRIPTION: Places a orange line segment connecting (170, 67) to (253, 209).
; PLAN: r0=170(x1), r1=67(y1), r2=253(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 67
LDI r2, 253
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
