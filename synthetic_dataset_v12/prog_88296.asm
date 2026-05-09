; DESCRIPTION: Creates a orange circular shape at (317, 162) with radius 19.
; PLAN: r0=317(x), r1=162(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 162
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
