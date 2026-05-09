; DESCRIPTION: Draws a green circle centered at (156, 126) with radius 52.
; PLAN: r0=156(x), r1=126(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 126
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
