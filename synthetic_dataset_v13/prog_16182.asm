; DESCRIPTION: Places a red line segment connecting (306, 205) to (424, 153).
; PLAN: r0=306(x1), r1=205(y1), r2=424(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 205
LDI r2, 424
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
