; DESCRIPTION: Draws a cyan circle centered at (195, 81) with radius 28.
; PLAN: r0=195(x), r1=81(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 81
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
