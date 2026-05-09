; DESCRIPTION: Renders a red line between points (197, 122) and (381, 88).
; PLAN: r0=197(x1), r1=122(y1), r2=381(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 122
LDI r2, 381
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
