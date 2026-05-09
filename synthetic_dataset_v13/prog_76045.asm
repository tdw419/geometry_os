; DESCRIPTION: Creates a red circular shape at (240, 106) with radius 55.
; PLAN: r0=240(x), r1=106(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 106
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
