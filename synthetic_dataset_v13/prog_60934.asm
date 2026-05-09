; DESCRIPTION: Creates a black circular shape at (202, 111) with radius 50.
; PLAN: r0=202(x), r1=111(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 111
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
