; DESCRIPTION: Draws a white circle centered at (249, 84) with radius 42.
; PLAN: r0=249(x), r1=84(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 84
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
