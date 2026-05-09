; DESCRIPTION: Draws a cyan circle centered at (246, 87) with radius 37.
; PLAN: r0=246(x), r1=87(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 87
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
