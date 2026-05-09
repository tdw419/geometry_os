; DESCRIPTION: Draws a white circle centered at (174, 82) with radius 77.
; PLAN: r0=174(x), r1=82(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 82
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
