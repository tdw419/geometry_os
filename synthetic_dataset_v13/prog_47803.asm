; DESCRIPTION: Creates a orange circular shape at (214, 177) with radius 69.
; PLAN: r0=214(x), r1=177(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 177
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
