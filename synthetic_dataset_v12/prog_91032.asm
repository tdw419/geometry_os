; DESCRIPTION: Creates a green circular shape at (50, 46) with radius 10.
; PLAN: r0=50(x), r1=46(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 46
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
