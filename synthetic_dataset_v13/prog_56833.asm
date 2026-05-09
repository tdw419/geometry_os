; DESCRIPTION: Creates a blue circular shape at (237, 239) with radius 10.
; PLAN: r0=237(x), r1=239(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 239
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
