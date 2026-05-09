; DESCRIPTION: Draws a white circle centered at (434, 124) with radius 37.
; PLAN: r0=434(x), r1=124(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 124
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
