; DESCRIPTION: Creates a orange circular shape at (322, 194) with radius 14.
; PLAN: r0=322(x), r1=194(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 194
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
