; DESCRIPTION: Renders a purple line between points (265, 209) and (12, 233).
; PLAN: r0=265(x1), r1=209(y1), r2=12(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 209
LDI r2, 12
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
