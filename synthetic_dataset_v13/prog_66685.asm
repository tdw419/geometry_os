; DESCRIPTION: Renders a purple disk with center (366, 128) and radius 64.
; PLAN: r0=366(x), r1=128(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 128
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
