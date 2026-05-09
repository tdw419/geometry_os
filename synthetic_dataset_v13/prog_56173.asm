; DESCRIPTION: Draws a white circle centered at (423, 202) with radius 52.
; PLAN: r0=423(x), r1=202(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 202
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
