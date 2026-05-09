; DESCRIPTION: Creates a red circular shape at (302, 72) with radius 65.
; PLAN: r0=302(x), r1=72(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 72
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
