; DESCRIPTION: Renders a purple disk with center (326, 128) and radius 57.
; PLAN: r0=326(x), r1=128(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 128
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
