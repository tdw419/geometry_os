; DESCRIPTION: Creates a red circular shape at (222, 188) with radius 56.
; PLAN: r0=222(x), r1=188(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 188
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
