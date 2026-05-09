; DESCRIPTION: Renders a purple disk with center (387, 184) and radius 32.
; PLAN: r0=387(x), r1=184(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 184
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
