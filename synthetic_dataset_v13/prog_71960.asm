; DESCRIPTION: Renders a purple disk with center (79, 174) and radius 68.
; PLAN: r0=79(x), r1=174(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 174
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
