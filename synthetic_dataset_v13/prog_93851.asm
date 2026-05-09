; DESCRIPTION: Creates a red circular shape at (46, 177) with radius 33.
; PLAN: r0=46(x), r1=177(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 177
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
