; DESCRIPTION: Renders a blue line between points (433, 253) and (109, 5).
; PLAN: r0=433(x1), r1=253(y1), r2=109(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 253
LDI r2, 109
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
