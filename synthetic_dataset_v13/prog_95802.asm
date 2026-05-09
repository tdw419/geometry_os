; DESCRIPTION: Creates a red circular shape at (120, 171) with radius 20.
; PLAN: r0=120(x), r1=171(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 171
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
