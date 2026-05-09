; DESCRIPTION: Renders a orange line between points (269, 179) and (175, 111).
; PLAN: r0=269(x1), r1=179(y1), r2=175(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 179
LDI r2, 175
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
