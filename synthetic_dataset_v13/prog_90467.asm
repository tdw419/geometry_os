; DESCRIPTION: Draws a white circle centered at (387, 114) with radius 50.
; PLAN: r0=387(x), r1=114(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 114
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
