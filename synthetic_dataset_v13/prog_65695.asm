; DESCRIPTION: Creates a red circular shape at (304, 153) with radius 27.
; PLAN: r0=304(x), r1=153(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 153
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
