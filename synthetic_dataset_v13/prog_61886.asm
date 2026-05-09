; DESCRIPTION: Renders a white line between points (141, 123) and (287, 111).
; PLAN: r0=141(x1), r1=123(y1), r2=287(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 123
LDI r2, 287
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
