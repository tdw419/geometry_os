; DESCRIPTION: Draws a black circle centered at (116, 151) with radius 59.
; PLAN: r0=116(x), r1=151(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 151
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
