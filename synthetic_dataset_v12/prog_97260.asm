; DESCRIPTION: Draws a cyan circle centered at (190, 74) with radius 33.
; PLAN: r0=190(x), r1=74(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 74
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
