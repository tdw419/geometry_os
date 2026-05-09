; DESCRIPTION: Draws a white circle centered at (91, 109) with radius 74.
; PLAN: r0=91(x), r1=109(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 109
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
