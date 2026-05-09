; DESCRIPTION: Places a red line segment connecting (444, 194) to (420, 147).
; PLAN: r0=444(x1), r1=194(y1), r2=420(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 194
LDI r2, 420
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
