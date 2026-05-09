; DESCRIPTION: Creates a cyan circular shape at (402, 117) with radius 70.
; PLAN: r0=402(x), r1=117(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 117
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
