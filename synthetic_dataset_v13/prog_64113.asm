; DESCRIPTION: Renders a red line between points (110, 246) and (369, 111).
; PLAN: r0=110(x1), r1=246(y1), r2=369(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 246
LDI r2, 369
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
