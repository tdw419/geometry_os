; DESCRIPTION: Creates a green rectangular region at (238, 131) spanning 101 by 99 pixels.
; PLAN: r0=238(x), r1=131(y), r2=101(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 131
LDI r2, 101
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
