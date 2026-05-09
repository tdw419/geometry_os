; DESCRIPTION: Creates a red circular shape at (454, 190) with radius 43.
; PLAN: r0=454(x), r1=190(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 190
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
