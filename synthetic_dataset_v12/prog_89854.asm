; DESCRIPTION: Renders a blue line between points (358, 69) and (26, 111).
; PLAN: r0=358(x1), r1=69(y1), r2=26(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 69
LDI r2, 26
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
