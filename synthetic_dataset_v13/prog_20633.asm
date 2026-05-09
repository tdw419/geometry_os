; DESCRIPTION: Creates a green circular shape at (102, 178) with radius 46.
; PLAN: r0=102(x), r1=178(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 178
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
