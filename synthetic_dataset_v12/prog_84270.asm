; DESCRIPTION: Draws a white circle centered at (350, 168) with radius 41.
; PLAN: r0=350(x), r1=168(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 168
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
