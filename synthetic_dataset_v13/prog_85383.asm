; DESCRIPTION: Places a purple circle of radius 75 at center (320, 128).
; PLAN: r0=320(x), r1=128(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 128
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
