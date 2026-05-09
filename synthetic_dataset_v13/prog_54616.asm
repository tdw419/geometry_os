; DESCRIPTION: Creates a yellow circular shape at (366, 82) with radius 77.
; PLAN: r0=366(x), r1=82(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 82
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
