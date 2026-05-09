; DESCRIPTION: Creates a red circular shape at (386, 121) with radius 43.
; PLAN: r0=386(x), r1=121(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 121
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
