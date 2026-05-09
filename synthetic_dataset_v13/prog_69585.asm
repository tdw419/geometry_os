; DESCRIPTION: Draws a white circle centered at (309, 187) with radius 55.
; PLAN: r0=309(x), r1=187(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 187
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
