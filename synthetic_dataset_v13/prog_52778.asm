; DESCRIPTION: Creates a green circular shape at (308, 190) with radius 28.
; PLAN: r0=308(x), r1=190(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 190
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
