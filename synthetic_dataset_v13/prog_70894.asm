; DESCRIPTION: Creates a orange circular shape at (298, 162) with radius 45.
; PLAN: r0=298(x), r1=162(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 162
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
