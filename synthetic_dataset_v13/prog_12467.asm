; DESCRIPTION: Creates a orange circular shape at (435, 47) with radius 22.
; PLAN: r0=435(x), r1=47(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 47
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
