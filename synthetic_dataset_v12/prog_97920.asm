; DESCRIPTION: Draws a red circle centered at (402, 68) with radius 49.
; PLAN: r0=402(x), r1=68(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 68
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
