; DESCRIPTION: Renders a blue line between points (338, 53) and (200, 111).
; PLAN: r0=338(x1), r1=53(y1), r2=200(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 53
LDI r2, 200
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
