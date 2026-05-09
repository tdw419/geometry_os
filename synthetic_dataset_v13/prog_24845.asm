; DESCRIPTION: Draws a white circle centered at (380, 215) with radius 23.
; PLAN: r0=380(x), r1=215(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 215
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
