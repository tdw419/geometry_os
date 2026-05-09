; DESCRIPTION: Draws a white circle centered at (457, 93) with radius 42.
; PLAN: r0=457(x), r1=93(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 93
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
