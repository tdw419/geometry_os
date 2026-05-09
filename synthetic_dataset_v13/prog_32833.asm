; DESCRIPTION: Creates a green circular shape at (276, 160) with radius 77.
; PLAN: r0=276(x), r1=160(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 160
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
