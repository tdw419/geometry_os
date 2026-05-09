; DESCRIPTION: Creates a orange circular shape at (199, 168) with radius 80.
; PLAN: r0=199(x), r1=168(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 168
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
