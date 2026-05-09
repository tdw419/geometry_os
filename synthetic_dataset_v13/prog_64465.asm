; DESCRIPTION: Creates a yellow circular shape at (98, 152) with radius 71.
; PLAN: r0=98(x), r1=152(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 152
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
