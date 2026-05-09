; DESCRIPTION: Draws a white circle centered at (45, 94) with radius 42.
; PLAN: r0=45(x), r1=94(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 94
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
