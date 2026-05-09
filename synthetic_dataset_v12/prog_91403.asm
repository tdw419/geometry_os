; DESCRIPTION: Creates a yellow circular shape at (363, 73) with radius 59.
; PLAN: r0=363(x), r1=73(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 73
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
