; DESCRIPTION: Renders a purple line between points (97, 13) and (403, 253).
; PLAN: r0=97(x1), r1=13(y1), r2=403(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 13
LDI r2, 403
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
