; DESCRIPTION: Draws a cyan circle centered at (32, 81) with radius 13.
; PLAN: r0=32(x), r1=81(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 81
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
