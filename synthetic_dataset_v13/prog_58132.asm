; DESCRIPTION: Draws a cyan circle centered at (73, 175) with radius 17.
; PLAN: r0=73(x), r1=175(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 175
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
