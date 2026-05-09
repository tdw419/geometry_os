; DESCRIPTION: Creates a orange circular shape at (302, 93) with radius 69.
; PLAN: r0=302(x), r1=93(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 93
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
