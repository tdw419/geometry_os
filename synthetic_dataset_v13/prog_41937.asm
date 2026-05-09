; DESCRIPTION: Renders a magenta line between points (287, 219) and (323, 111).
; PLAN: r0=287(x1), r1=219(y1), r2=323(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 219
LDI r2, 323
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
