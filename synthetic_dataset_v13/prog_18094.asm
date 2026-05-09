; DESCRIPTION: Renders a yellow line between points (361, 10) and (507, 111).
; PLAN: r0=361(x1), r1=10(y1), r2=507(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 10
LDI r2, 507
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
