; DESCRIPTION: Creates a cyan circular shape at (402, 178) with radius 50.
; PLAN: r0=402(x), r1=178(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 178
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
