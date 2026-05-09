; DESCRIPTION: Creates a red circular shape at (225, 156) with radius 27.
; PLAN: r0=225(x), r1=156(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 156
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
