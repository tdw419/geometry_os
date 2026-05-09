; DESCRIPTION: Creates a yellow circular shape at (198, 107) with radius 40.
; PLAN: r0=198(x), r1=107(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 107
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
