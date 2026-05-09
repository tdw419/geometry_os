; DESCRIPTION: Creates a orange circular shape at (142, 146) with radius 20.
; PLAN: r0=142(x), r1=146(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 146
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
