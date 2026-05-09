; DESCRIPTION: Creates a red circular shape at (158, 64) with radius 50.
; PLAN: r0=158(x), r1=64(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 64
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
