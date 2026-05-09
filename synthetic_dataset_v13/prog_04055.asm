; DESCRIPTION: Draws a green circle centered at (154, 85) with radius 20.
; PLAN: r0=154(x), r1=85(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 85
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
