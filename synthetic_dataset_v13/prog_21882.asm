; DESCRIPTION: Creates a green circular shape at (386, 104) with radius 42.
; PLAN: r0=386(x), r1=104(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 104
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
