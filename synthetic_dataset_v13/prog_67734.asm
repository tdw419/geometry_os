; DESCRIPTION: Renders a purple line between points (498, 214) and (253, 59).
; PLAN: r0=498(x1), r1=214(y1), r2=253(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 214
LDI r2, 253
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
