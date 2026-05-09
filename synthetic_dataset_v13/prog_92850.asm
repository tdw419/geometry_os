; DESCRIPTION: Renders a blue line between points (80, 4) and (420, 111).
; PLAN: r0=80(x1), r1=4(y1), r2=420(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 4
LDI r2, 420
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
