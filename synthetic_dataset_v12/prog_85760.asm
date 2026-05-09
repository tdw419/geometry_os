; DESCRIPTION: Creates a blue circular shape at (346, 68) with radius 59.
; PLAN: r0=346(x), r1=68(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 68
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
