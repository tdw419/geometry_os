; DESCRIPTION: Renders a purple line between points (336, 204) and (29, 177).
; PLAN: r0=336(x1), r1=204(y1), r2=29(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 204
LDI r2, 29
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
