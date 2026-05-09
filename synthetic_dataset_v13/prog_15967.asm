; DESCRIPTION: Creates a green circular shape at (264, 231) with radius 11.
; PLAN: r0=264(x), r1=231(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 231
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
