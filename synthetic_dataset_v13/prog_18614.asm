; DESCRIPTION: Creates a white rectangular region at (337, 22) spanning 101 by 92 pixels.
; PLAN: r0=337(x), r1=22(y), r2=101(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 22
LDI r2, 101
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
