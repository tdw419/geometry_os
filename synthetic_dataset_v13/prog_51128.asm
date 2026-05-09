; DESCRIPTION: Draws a white circle centered at (387, 100) with radius 25.
; PLAN: r0=387(x), r1=100(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 100
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
