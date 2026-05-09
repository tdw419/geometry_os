; DESCRIPTION: Creates a black circular shape at (50, 190) with radius 16.
; PLAN: r0=50(x), r1=190(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 190
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
