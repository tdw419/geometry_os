; DESCRIPTION: Places a orange line segment connecting (331, 207) to (112, 253).
; PLAN: r0=331(x1), r1=207(y1), r2=112(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 207
LDI r2, 112
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
