; DESCRIPTION: Renders a blue disk with center (215, 128) and radius 56.
; PLAN: r0=215(x), r1=128(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 128
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
