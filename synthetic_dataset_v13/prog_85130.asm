; DESCRIPTION: Creates a yellow circular shape at (398, 204) with radius 41.
; PLAN: r0=398(x), r1=204(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 204
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
