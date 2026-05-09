; DESCRIPTION: Renders a purple line between points (240, 113) and (71, 42).
; PLAN: r0=240(x1), r1=113(y1), r2=71(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 113
LDI r2, 71
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
