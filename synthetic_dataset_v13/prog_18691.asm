; DESCRIPTION: Draws a black circle centered at (458, 150) with radius 27.
; PLAN: r0=458(x), r1=150(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 150
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
