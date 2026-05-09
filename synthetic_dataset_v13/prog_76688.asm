; DESCRIPTION: Creates a white rectangular region at (472, 25) spanning 29 by 76 pixels.
; PLAN: r0=472(x), r1=25(y), r2=29(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 25
LDI r2, 29
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
