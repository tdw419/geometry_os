; DESCRIPTION: Renders a purple line between points (335, 45) and (72, 202).
; PLAN: r0=335(x1), r1=45(y1), r2=72(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 45
LDI r2, 72
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
