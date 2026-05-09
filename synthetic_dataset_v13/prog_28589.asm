; DESCRIPTION: Draws a black circle centered at (416, 93) with radius 58.
; PLAN: r0=416(x), r1=93(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 93
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
