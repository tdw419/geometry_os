; DESCRIPTION: Renders a red line between points (9, 22) and (43, 183).
; PLAN: r0=9(x1), r1=22(y1), r2=43(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 22
LDI r2, 43
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
