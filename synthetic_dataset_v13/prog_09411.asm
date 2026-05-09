; DESCRIPTION: Creates a yellow circular shape at (208, 71) with radius 68.
; PLAN: r0=208(x), r1=71(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 71
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
