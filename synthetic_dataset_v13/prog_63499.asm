; DESCRIPTION: Creates a green circular shape at (307, 126) with radius 62.
; PLAN: r0=307(x), r1=126(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 126
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
