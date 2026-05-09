; DESCRIPTION: Creates a red circular shape at (408, 133) with radius 37.
; PLAN: r0=408(x), r1=133(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 133
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
