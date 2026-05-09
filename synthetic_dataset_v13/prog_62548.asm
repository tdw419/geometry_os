; DESCRIPTION: Creates a red circular shape at (298, 81) with radius 10.
; PLAN: r0=298(x), r1=81(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 81
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
