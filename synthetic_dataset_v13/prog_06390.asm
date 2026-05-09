; DESCRIPTION: Renders a purple line between points (322, 12) and (305, 111).
; PLAN: r0=322(x1), r1=12(y1), r2=305(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 12
LDI r2, 305
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
