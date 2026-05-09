; DESCRIPTION: Renders a red line between points (334, 102) and (474, 24).
; PLAN: r0=334(x1), r1=102(y1), r2=474(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 102
LDI r2, 474
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
