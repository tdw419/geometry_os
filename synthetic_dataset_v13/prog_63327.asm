; DESCRIPTION: Renders a blue line between points (452, 104) and (165, 103).
; PLAN: r0=452(x1), r1=104(y1), r2=165(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 104
LDI r2, 165
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
