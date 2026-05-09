; DESCRIPTION: Draws a white circle centered at (396, 187) with radius 57.
; PLAN: r0=396(x), r1=187(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 187
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
