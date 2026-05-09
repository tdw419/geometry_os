; DESCRIPTION: Draws a yellow circle centered at (349, 126) with radius 60.
; PLAN: r0=349(x), r1=126(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 126
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
