; DESCRIPTION: Creates a yellow circular shape at (290, 207) with radius 43.
; PLAN: r0=290(x), r1=207(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 207
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
