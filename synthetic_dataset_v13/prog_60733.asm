; DESCRIPTION: Creates a white circular shape at (187, 154) with radius 39.
; PLAN: r0=187(x), r1=154(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 154
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
