; DESCRIPTION: Draws a blue circle centered at (294, 204) with radius 42.
; PLAN: r0=294(x), r1=204(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 204
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
