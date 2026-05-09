; DESCRIPTION: Draws a black circle centered at (262, 98) with radius 80.
; PLAN: r0=262(x), r1=98(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 98
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
