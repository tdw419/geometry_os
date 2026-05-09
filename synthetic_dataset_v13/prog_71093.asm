; DESCRIPTION: Creates a white rectangular region at (278, 105) spanning 103 by 62 pixels.
; PLAN: r0=278(x), r1=105(y), r2=103(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 105
LDI r2, 103
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
