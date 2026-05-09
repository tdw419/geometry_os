; DESCRIPTION: Draws a cyan circle centered at (402, 61) with radius 56.
; PLAN: r0=402(x), r1=61(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 61
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
