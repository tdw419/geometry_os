; DESCRIPTION: Creates a red circular shape at (378, 153) with radius 22.
; PLAN: r0=378(x), r1=153(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 153
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
