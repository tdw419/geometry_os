; DESCRIPTION: Renders a purple line between points (307, 188) and (374, 111).
; PLAN: r0=307(x1), r1=188(y1), r2=374(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 188
LDI r2, 374
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
