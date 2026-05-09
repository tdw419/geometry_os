; DESCRIPTION: Creates a orange circular shape at (437, 54) with radius 51.
; PLAN: r0=437(x), r1=54(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 54
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
