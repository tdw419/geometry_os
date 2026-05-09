; DESCRIPTION: Draws a green circle centered at (463, 55) with radius 42.
; PLAN: r0=463(x), r1=55(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 55
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
