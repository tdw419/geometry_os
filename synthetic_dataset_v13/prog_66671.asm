; DESCRIPTION: Draws a cyan circle centered at (18, 190) with radius 17.
; PLAN: r0=18(x), r1=190(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 190
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
