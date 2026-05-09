; DESCRIPTION: Renders a purple disk with center (351, 188) and radius 42.
; PLAN: r0=351(x), r1=188(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 188
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
