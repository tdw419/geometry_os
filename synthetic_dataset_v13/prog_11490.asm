; DESCRIPTION: Creates a white circular shape at (302, 177) with radius 65.
; PLAN: r0=302(x), r1=177(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 177
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
