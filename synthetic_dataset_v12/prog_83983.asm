; DESCRIPTION: Renders a purple line between points (46, 253) and (123, 79).
; PLAN: r0=46(x1), r1=253(y1), r2=123(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 253
LDI r2, 123
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
