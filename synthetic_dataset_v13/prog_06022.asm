; DESCRIPTION: Draws a red line from (355, 88) to (457, 39).
; PLAN: r0=355(x1), r1=88(y1), r2=457(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 88
LDI r2, 457
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
