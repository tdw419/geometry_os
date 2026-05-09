; DESCRIPTION: Draws a white circle centered at (386, 149) with radius 43.
; PLAN: r0=386(x), r1=149(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 149
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
