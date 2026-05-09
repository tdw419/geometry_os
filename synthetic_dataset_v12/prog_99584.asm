; DESCRIPTION: Creates a purple circular shape at (206, 166) with radius 64.
; PLAN: r0=206(x), r1=166(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 166
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
