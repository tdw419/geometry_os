; DESCRIPTION: Renders a purple line between points (149, 72) and (433, 111).
; PLAN: r0=149(x1), r1=72(y1), r2=433(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 72
LDI r2, 433
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
