; DESCRIPTION: Creates a white rectangular region at (258, 92) spanning 25 by 83 pixels.
; PLAN: r0=258(x), r1=92(y), r2=25(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 92
LDI r2, 25
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
