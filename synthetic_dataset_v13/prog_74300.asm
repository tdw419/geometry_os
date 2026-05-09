; DESCRIPTION: Creates a red circular shape at (272, 175) with radius 25.
; PLAN: r0=272(x), r1=175(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 175
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
