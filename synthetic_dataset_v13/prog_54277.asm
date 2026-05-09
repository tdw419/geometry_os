; DESCRIPTION: Renders a purple disk with center (365, 70) and radius 28.
; PLAN: r0=365(x), r1=70(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 70
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
