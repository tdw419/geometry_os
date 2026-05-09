; DESCRIPTION: Creates a red circular shape at (51, 205) with radius 35.
; PLAN: r0=51(x), r1=205(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 205
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
