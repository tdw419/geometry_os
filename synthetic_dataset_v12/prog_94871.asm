; DESCRIPTION: Draws a cyan circle centered at (270, 86) with radius 38.
; PLAN: r0=270(x), r1=86(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 86
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
