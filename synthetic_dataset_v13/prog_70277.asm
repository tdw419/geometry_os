; DESCRIPTION: Renders a purple disk with center (186, 168) and radius 79.
; PLAN: r0=186(x), r1=168(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 168
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
