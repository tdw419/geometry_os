; DESCRIPTION: Creates a yellow circular shape at (393, 169) with radius 53.
; PLAN: r0=393(x), r1=169(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 169
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
