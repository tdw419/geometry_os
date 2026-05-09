; DESCRIPTION: Renders a yellow line between points (336, 253) and (374, 87).
; PLAN: r0=336(x1), r1=253(y1), r2=374(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 253
LDI r2, 374
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
