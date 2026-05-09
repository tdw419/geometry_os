; DESCRIPTION: Creates a magenta circular shape at (480, 25) with radius 13.
; PLAN: r0=480(x), r1=25(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 25
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
