; DESCRIPTION: Draws a red line from (253, 91) to (313, 62).
; PLAN: r0=253(x1), r1=91(y1), r2=313(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 91
LDI r2, 313
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
