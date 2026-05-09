; DESCRIPTION: Renders a purple line between points (244, 203) and (434, 199).
; PLAN: r0=244(x1), r1=203(y1), r2=434(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 203
LDI r2, 434
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
