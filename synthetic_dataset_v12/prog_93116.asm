; DESCRIPTION: Creates a yellow circular shape at (267, 208) with radius 31.
; PLAN: r0=267(x), r1=208(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 208
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
