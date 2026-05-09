; DESCRIPTION: Places a red line segment connecting (431, 109) to (293, 227).
; PLAN: r0=431(x1), r1=109(y1), r2=293(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 109
LDI r2, 293
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
