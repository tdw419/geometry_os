; DESCRIPTION: Renders a blue line between points (299, 220) and (45, 104).
; PLAN: r0=299(x1), r1=220(y1), r2=45(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 220
LDI r2, 45
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
