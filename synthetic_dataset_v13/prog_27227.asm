; DESCRIPTION: Renders a red line between points (283, 26) and (474, 61).
; PLAN: r0=283(x1), r1=26(y1), r2=474(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 26
LDI r2, 474
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
