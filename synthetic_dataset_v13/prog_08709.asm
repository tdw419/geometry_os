; DESCRIPTION: Creates a orange circular shape at (279, 116) with radius 44.
; PLAN: r0=279(x), r1=116(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 116
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
