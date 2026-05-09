; DESCRIPTION: Draws a red circle centered at (464, 175) with radius 47.
; PLAN: r0=464(x), r1=175(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 175
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
