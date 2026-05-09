; DESCRIPTION: Renders a red line between points (189, 144) and (500, 194).
; PLAN: r0=189(x1), r1=144(y1), r2=500(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 144
LDI r2, 500
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
