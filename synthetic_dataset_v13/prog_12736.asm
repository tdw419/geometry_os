; DESCRIPTION: Creates a green circular shape at (77, 146) with radius 55.
; PLAN: r0=77(x), r1=146(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 146
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
