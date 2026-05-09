; DESCRIPTION: Creates a blue circular shape at (392, 125) with radius 56.
; PLAN: r0=392(x), r1=125(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 125
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
