; DESCRIPTION: Places a red line segment connecting (39, 167) to (364, 175).
; PLAN: r0=39(x1), r1=167(y1), r2=364(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 167
LDI r2, 364
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
