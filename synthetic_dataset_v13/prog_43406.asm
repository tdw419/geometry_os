; DESCRIPTION: Creates a orange circular shape at (322, 45) with radius 42.
; PLAN: r0=322(x), r1=45(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 45
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
