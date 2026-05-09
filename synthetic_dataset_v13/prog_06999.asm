; DESCRIPTION: Creates a green circular shape at (152, 162) with radius 56.
; PLAN: r0=152(x), r1=162(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 162
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
