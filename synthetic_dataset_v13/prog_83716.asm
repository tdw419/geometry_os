; DESCRIPTION: Creates a white circular shape at (303, 111) with radius 60.
; PLAN: r0=303(x), r1=111(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 111
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
