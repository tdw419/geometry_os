; DESCRIPTION: Draws a cyan circle centered at (346, 156) with radius 75.
; PLAN: r0=346(x), r1=156(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 156
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
