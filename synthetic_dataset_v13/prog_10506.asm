; DESCRIPTION: Draws a cyan circle centered at (340, 157) with radius 32.
; PLAN: r0=340(x), r1=157(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 157
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
