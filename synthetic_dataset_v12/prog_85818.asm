; DESCRIPTION: Creates a white rectangular region at (15, 76) spanning 87 by 29 pixels.
; PLAN: r0=15(x), r1=76(y), r2=87(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 76
LDI r2, 87
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
