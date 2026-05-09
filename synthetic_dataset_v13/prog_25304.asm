; DESCRIPTION: Creates a yellow circular shape at (432, 180) with radius 75.
; PLAN: r0=432(x), r1=180(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 180
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
