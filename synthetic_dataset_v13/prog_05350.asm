; DESCRIPTION: Renders a purple line between points (303, 178) and (166, 111).
; PLAN: r0=303(x1), r1=178(y1), r2=166(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 178
LDI r2, 166
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
