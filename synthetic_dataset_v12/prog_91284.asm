; DESCRIPTION: Creates a red circular shape at (425, 160) with radius 65.
; PLAN: r0=425(x), r1=160(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 160
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
