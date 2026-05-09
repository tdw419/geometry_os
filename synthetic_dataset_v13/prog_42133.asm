; DESCRIPTION: Draws a white circle centered at (243, 41) with radius 32.
; PLAN: r0=243(x), r1=41(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 41
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
