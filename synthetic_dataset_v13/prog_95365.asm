; DESCRIPTION: Creates a red circular shape at (281, 105) with radius 20.
; PLAN: r0=281(x), r1=105(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 105
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
