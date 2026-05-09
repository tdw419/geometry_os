; DESCRIPTION: Creates a red circular shape at (281, 86) with radius 72.
; PLAN: r0=281(x), r1=86(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 86
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
