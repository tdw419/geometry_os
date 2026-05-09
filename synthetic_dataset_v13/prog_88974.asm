; DESCRIPTION: Creates a orange circular shape at (401, 205) with radius 38.
; PLAN: r0=401(x), r1=205(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 205
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
