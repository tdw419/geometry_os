; DESCRIPTION: Creates a purple circular shape at (290, 117) with radius 43.
; PLAN: r0=290(x), r1=117(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 117
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
