; DESCRIPTION: Renders a magenta line between points (176, 83) and (204, 179).
; PLAN: r0=176(x1), r1=83(y1), r2=204(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 83
LDI r2, 204
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
