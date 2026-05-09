; DESCRIPTION: Draws a cyan circle centered at (114, 190) with radius 58.
; PLAN: r0=114(x), r1=190(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 190
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
