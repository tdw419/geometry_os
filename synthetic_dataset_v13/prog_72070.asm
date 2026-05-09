; DESCRIPTION: Creates a yellow circular shape at (349, 208) with radius 34.
; PLAN: r0=349(x), r1=208(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 208
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
