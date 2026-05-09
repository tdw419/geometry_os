; DESCRIPTION: Renders a red line between points (281, 34) and (402, 111).
; PLAN: r0=281(x1), r1=34(y1), r2=402(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 34
LDI r2, 402
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
