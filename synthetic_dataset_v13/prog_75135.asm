; DESCRIPTION: Renders a purple disk with center (167, 79) and radius 70.
; PLAN: r0=167(x), r1=79(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 79
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
