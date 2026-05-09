; DESCRIPTION: Renders a purple line between points (246, 146) and (291, 208).
; PLAN: r0=246(x1), r1=146(y1), r2=291(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 146
LDI r2, 291
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
