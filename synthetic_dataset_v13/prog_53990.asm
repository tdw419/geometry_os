; DESCRIPTION: Creates a orange circular shape at (372, 168) with radius 58.
; PLAN: r0=372(x), r1=168(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 168
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
