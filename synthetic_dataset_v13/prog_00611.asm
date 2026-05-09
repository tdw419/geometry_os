; DESCRIPTION: Draws a green circle centered at (402, 202) with radius 42.
; PLAN: r0=402(x), r1=202(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 202
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
