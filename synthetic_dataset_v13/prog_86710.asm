; DESCRIPTION: Creates a purple circular shape at (290, 171) with radius 21.
; PLAN: r0=290(x), r1=171(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 171
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
