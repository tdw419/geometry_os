; DESCRIPTION: Creates a red circular shape at (74, 117) with radius 21.
; PLAN: r0=74(x), r1=117(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 117
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
