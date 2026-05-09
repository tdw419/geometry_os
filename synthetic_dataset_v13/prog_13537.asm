; DESCRIPTION: Draws a black circle centered at (360, 68) with radius 59.
; PLAN: r0=360(x), r1=68(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 68
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
