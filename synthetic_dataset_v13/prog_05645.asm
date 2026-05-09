; DESCRIPTION: Places a red line segment connecting (172, 253) to (312, 37).
; PLAN: r0=172(x1), r1=253(y1), r2=312(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 253
LDI r2, 312
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
