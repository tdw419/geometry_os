; DESCRIPTION: Renders a red line between points (253, 193) and (402, 44).
; PLAN: r0=253(x1), r1=193(y1), r2=402(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 193
LDI r2, 402
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
