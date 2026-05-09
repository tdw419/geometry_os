; DESCRIPTION: Renders a red line between points (14, 7) and (176, 130).
; PLAN: r0=14(x1), r1=7(y1), r2=176(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 7
LDI r2, 176
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
