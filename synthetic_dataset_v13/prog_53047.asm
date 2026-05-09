; DESCRIPTION: Draws a white circle centered at (337, 104) with radius 40.
; PLAN: r0=337(x), r1=104(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 104
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
