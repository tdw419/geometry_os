; DESCRIPTION: Renders a purple disk with center (126, 143) and radius 30.
; PLAN: r0=126(x), r1=143(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 143
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
