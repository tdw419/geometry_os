; DESCRIPTION: Draws a white circle centered at (190, 182) with radius 70.
; PLAN: r0=190(x), r1=182(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 182
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
