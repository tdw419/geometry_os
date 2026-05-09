; DESCRIPTION: Creates a purple circular shape at (174, 91) with radius 66.
; PLAN: r0=174(x), r1=91(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 91
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
