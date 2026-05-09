; DESCRIPTION: Creates a orange circular shape at (296, 131) with radius 20.
; PLAN: r0=296(x), r1=131(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 131
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
