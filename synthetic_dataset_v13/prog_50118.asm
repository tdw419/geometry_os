; DESCRIPTION: Draws a green circle centered at (42, 38) with radius 23.
; PLAN: r0=42(x), r1=38(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 38
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
