; DESCRIPTION: Draws a red line from (68, 31) to (407, 1).
; PLAN: r0=68(x1), r1=31(y1), r2=407(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 31
LDI r2, 407
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
