; DESCRIPTION: Places a red line segment connecting (306, 222) to (500, 170).
; PLAN: r0=306(x1), r1=222(y1), r2=500(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 222
LDI r2, 500
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
