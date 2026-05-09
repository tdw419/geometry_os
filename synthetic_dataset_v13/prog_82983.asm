; DESCRIPTION: Renders a red line between points (353, 155) and (356, 255).
; PLAN: r0=353(x1), r1=155(y1), r2=356(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 155
LDI r2, 356
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
