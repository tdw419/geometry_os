; DESCRIPTION: Draws a cyan circle centered at (276, 96) with radius 35.
; PLAN: r0=276(x), r1=96(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 96
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
