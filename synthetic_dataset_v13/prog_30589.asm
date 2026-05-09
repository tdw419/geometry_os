; DESCRIPTION: Places a red line segment connecting (268, 247) to (31, 123).
; PLAN: r0=268(x1), r1=247(y1), r2=31(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 247
LDI r2, 31
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
