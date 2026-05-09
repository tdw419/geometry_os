; DESCRIPTION: Creates a green circular shape at (169, 65) with radius 58.
; PLAN: r0=169(x), r1=65(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 65
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
