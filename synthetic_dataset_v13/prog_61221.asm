; DESCRIPTION: Renders a red line between points (163, 116) and (231, 111).
; PLAN: r0=163(x1), r1=116(y1), r2=231(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 116
LDI r2, 231
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
