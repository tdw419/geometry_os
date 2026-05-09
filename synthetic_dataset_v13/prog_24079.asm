; DESCRIPTION: Creates a black circular shape at (72, 208) with radius 46.
; PLAN: r0=72(x), r1=208(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 208
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
