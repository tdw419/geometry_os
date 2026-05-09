; DESCRIPTION: Creates a black circular shape at (301, 141) with radius 27.
; PLAN: r0=301(x), r1=141(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 141
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
