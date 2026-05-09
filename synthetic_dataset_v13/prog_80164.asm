; DESCRIPTION: Renders a black line between points (31, 26) and (309, 111).
; PLAN: r0=31(x1), r1=26(y1), r2=309(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 26
LDI r2, 309
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
