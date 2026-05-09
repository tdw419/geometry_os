; DESCRIPTION: Renders a red line between points (474, 68) and (242, 111).
; PLAN: r0=474(x1), r1=68(y1), r2=242(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 68
LDI r2, 242
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
