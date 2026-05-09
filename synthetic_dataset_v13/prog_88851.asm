; DESCRIPTION: Draws a green circle centered at (184, 177) with radius 27.
; PLAN: r0=184(x), r1=177(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 177
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
