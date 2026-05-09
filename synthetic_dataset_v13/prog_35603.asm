; DESCRIPTION: Creates a blue circular shape at (255, 174) with radius 78.
; PLAN: r0=255(x), r1=174(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 174
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
