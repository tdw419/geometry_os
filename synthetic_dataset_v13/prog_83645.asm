; DESCRIPTION: Renders a purple line between points (49, 27) and (336, 68).
; PLAN: r0=49(x1), r1=27(y1), r2=336(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 27
LDI r2, 336
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
