; DESCRIPTION: Draws a cyan circle centered at (399, 190) with radius 36.
; PLAN: r0=399(x), r1=190(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 190
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
