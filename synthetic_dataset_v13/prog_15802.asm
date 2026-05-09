; DESCRIPTION: Renders a purple line between points (346, 104) and (153, 145).
; PLAN: r0=346(x1), r1=104(y1), r2=153(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 104
LDI r2, 153
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
