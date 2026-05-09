; DESCRIPTION: Renders a purple line between points (299, 253) and (474, 60).
; PLAN: r0=299(x1), r1=253(y1), r2=474(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 253
LDI r2, 474
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
