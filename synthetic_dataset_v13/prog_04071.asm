; DESCRIPTION: Creates a red circular shape at (269, 106) with radius 33.
; PLAN: r0=269(x), r1=106(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 106
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
