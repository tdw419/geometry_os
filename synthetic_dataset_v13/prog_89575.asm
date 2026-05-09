; DESCRIPTION: Creates a yellow circular shape at (179, 208) with radius 43.
; PLAN: r0=179(x), r1=208(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 208
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
