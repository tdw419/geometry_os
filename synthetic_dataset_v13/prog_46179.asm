; DESCRIPTION: Draws a black circle centered at (202, 93) with radius 19.
; PLAN: r0=202(x), r1=93(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 93
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
