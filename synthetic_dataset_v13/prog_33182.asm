; DESCRIPTION: Creates a orange circular shape at (126, 198) with radius 20.
; PLAN: r0=126(x), r1=198(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 198
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
