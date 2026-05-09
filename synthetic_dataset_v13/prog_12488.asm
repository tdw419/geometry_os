; DESCRIPTION: Draws a red circle centered at (255, 183) with radius 69.
; PLAN: r0=255(x), r1=183(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 183
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
