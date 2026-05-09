; DESCRIPTION: Renders a purple line between points (274, 253) and (12, 231).
; PLAN: r0=274(x1), r1=253(y1), r2=12(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 253
LDI r2, 12
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
