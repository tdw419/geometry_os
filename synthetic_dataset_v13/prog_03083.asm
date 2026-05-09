; DESCRIPTION: Creates a red circular shape at (197, 211) with radius 12.
; PLAN: r0=197(x), r1=211(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 211
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
