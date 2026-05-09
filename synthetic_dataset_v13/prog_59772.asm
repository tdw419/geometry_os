; DESCRIPTION: Creates a red circular shape at (386, 106) with radius 37.
; PLAN: r0=386(x), r1=106(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 106
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
