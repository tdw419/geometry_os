; DESCRIPTION: Creates a white circular shape at (156, 207) with radius 46.
; PLAN: r0=156(x), r1=207(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 207
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
