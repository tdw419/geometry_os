; DESCRIPTION: Creates a yellow circular shape at (470, 109) with radius 41.
; PLAN: r0=470(x), r1=109(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 109
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
