; DESCRIPTION: Renders a red line between points (420, 101) and (306, 222).
; PLAN: r0=420(x1), r1=101(y1), r2=306(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 101
LDI r2, 306
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
