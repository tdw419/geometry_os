; DESCRIPTION: Renders a purple line between points (265, 61) and (86, 241).
; PLAN: r0=265(x1), r1=61(y1), r2=86(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 61
LDI r2, 86
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
