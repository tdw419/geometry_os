; DESCRIPTION: Creates a white circular shape at (391, 111) with radius 77.
; PLAN: r0=391(x), r1=111(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 111
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
