; DESCRIPTION: Draws a purple line from (400, 169) to (257, 111).
; PLAN: r0=400(x1), r1=169(y1), r2=257(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 169
LDI r2, 257
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
