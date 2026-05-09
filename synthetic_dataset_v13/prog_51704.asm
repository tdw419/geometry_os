; DESCRIPTION: Creates a red circular shape at (210, 44) with radius 27.
; PLAN: r0=210(x), r1=44(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 44
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
