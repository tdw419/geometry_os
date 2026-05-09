; DESCRIPTION: Creates a yellow circular shape at (171, 138) with radius 79.
; PLAN: r0=171(x), r1=138(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 138
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
