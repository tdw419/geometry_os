; DESCRIPTION: Places a blue circle of radius 21 at center (173, 81).
; PLAN: r0=173(x), r1=81(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 81
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
