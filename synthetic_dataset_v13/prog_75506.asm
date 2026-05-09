; DESCRIPTION: Places a red line segment connecting (174, 199) to (253, 78).
; PLAN: r0=174(x1), r1=199(y1), r2=253(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 199
LDI r2, 253
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
