; DESCRIPTION: Draws a black circle centered at (193, 188) with radius 27.
; PLAN: r0=193(x), r1=188(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 188
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
