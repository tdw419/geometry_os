; DESCRIPTION: Creates a orange circular shape at (439, 204) with radius 50.
; PLAN: r0=439(x), r1=204(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 204
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
