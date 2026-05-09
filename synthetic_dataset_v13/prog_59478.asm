; DESCRIPTION: Creates a purple circular shape at (228, 212) with radius 28.
; PLAN: r0=228(x), r1=212(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 212
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
