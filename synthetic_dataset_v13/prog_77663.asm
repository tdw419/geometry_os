; DESCRIPTION: Creates a blue circular shape at (480, 74) with radius 13.
; PLAN: r0=480(x), r1=74(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 74
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
