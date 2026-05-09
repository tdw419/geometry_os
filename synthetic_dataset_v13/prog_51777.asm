; DESCRIPTION: Renders a red line between points (29, 11) and (128, 129).
; PLAN: r0=29(x1), r1=11(y1), r2=128(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 11
LDI r2, 128
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
