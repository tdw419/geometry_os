; DESCRIPTION: Draws a white circle centered at (80, 164) with radius 65.
; PLAN: r0=80(x), r1=164(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 164
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
