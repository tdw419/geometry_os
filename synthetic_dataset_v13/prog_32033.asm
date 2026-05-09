; DESCRIPTION: Renders a purple line between points (291, 193) and (286, 202).
; PLAN: r0=291(x1), r1=193(y1), r2=286(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 193
LDI r2, 286
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
