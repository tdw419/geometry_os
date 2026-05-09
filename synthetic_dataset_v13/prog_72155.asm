; DESCRIPTION: Renders a purple line between points (207, 188) and (299, 48).
; PLAN: r0=207(x1), r1=188(y1), r2=299(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 188
LDI r2, 299
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
