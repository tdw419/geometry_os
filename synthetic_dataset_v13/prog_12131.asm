; DESCRIPTION: Creates a orange circular shape at (328, 214) with radius 17.
; PLAN: r0=328(x), r1=214(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 214
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
