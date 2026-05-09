; DESCRIPTION: Creates a white circular shape at (333, 150) with radius 58.
; PLAN: r0=333(x), r1=150(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 150
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
