; DESCRIPTION: Draws a white circle centered at (60, 120) with radius 36.
; PLAN: r0=60(x), r1=120(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 120
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
