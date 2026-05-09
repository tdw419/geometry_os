; DESCRIPTION: Creates a white circular shape at (206, 117) with radius 47.
; PLAN: r0=206(x), r1=117(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 117
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
