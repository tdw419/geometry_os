; DESCRIPTION: Creates a black circular shape at (175, 160) with radius 50.
; PLAN: r0=175(x), r1=160(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 160
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
