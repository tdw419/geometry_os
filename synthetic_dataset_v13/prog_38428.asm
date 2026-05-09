; DESCRIPTION: Renders a blue line between points (477, 12) and (48, 104).
; PLAN: r0=477(x1), r1=12(y1), r2=48(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 12
LDI r2, 48
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
