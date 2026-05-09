; DESCRIPTION: Creates a yellow rectangular region at (131, 100) spanning 14 by 81 pixels.
; PLAN: r0=131(x), r1=100(y), r2=14(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 100
LDI r2, 14
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
