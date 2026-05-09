; DESCRIPTION: Draws a white circle centered at (120, 46) with radius 42.
; PLAN: r0=120(x), r1=46(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 46
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
