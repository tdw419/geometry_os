; DESCRIPTION: Creates a orange circular shape at (236, 177) with radius 59.
; PLAN: r0=236(x), r1=177(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 177
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
