; DESCRIPTION: Renders a blue line between points (361, 48) and (402, 11).
; PLAN: r0=361(x1), r1=48(y1), r2=402(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 48
LDI r2, 402
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
