; DESCRIPTION: Draws a white circle centered at (300, 162) with radius 57.
; PLAN: r0=300(x), r1=162(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 162
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
