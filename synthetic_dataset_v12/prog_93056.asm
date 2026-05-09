; DESCRIPTION: Draws a green circle centered at (469, 190) with radius 26.
; PLAN: r0=469(x), r1=190(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 190
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
