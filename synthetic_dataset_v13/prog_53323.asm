; DESCRIPTION: Draws a red circle centered at (254, 86) with radius 50.
; PLAN: r0=254(x), r1=86(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 86
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
