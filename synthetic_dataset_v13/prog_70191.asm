; DESCRIPTION: Renders a purple line between points (372, 93) and (489, 223).
; PLAN: r0=372(x1), r1=93(y1), r2=489(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 93
LDI r2, 489
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
