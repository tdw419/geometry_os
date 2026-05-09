; DESCRIPTION: Draws a red circle centered at (268, 154) with radius 45.
; PLAN: r0=268(x), r1=154(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 154
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
