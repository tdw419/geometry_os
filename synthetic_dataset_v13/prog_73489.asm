; DESCRIPTION: Draws a blue circle centered at (91, 154) with radius 42.
; PLAN: r0=91(x), r1=154(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 154
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
