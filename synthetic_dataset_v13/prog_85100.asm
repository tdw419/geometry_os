; DESCRIPTION: Draws a white circle centered at (150, 154) with radius 65.
; PLAN: r0=150(x), r1=154(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 154
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
