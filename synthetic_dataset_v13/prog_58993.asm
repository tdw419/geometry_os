; DESCRIPTION: Places a red line segment connecting (434, 101) to (74, 111).
; PLAN: r0=434(x1), r1=101(y1), r2=74(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 101
LDI r2, 74
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
