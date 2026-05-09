; DESCRIPTION: Places a red line segment connecting (313, 178) to (318, 28).
; PLAN: r0=313(x1), r1=178(y1), r2=318(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 178
LDI r2, 318
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
