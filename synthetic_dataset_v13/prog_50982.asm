; DESCRIPTION: Creates a green circular shape at (328, 91) with radius 58.
; PLAN: r0=328(x), r1=91(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 91
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
