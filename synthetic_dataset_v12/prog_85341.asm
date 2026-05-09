; DESCRIPTION: Renders a red line between points (144, 176) and (10, 12).
; PLAN: r0=144(x1), r1=176(y1), r2=10(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 176
LDI r2, 10
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
