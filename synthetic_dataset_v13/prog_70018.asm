; DESCRIPTION: Renders a purple disk with center (379, 96) and radius 16.
; PLAN: r0=379(x), r1=96(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 96
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
