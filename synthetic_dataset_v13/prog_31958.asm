; DESCRIPTION: Creates a red circular shape at (84, 160) with radius 72.
; PLAN: r0=84(x), r1=160(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 160
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
