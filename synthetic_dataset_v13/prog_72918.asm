; DESCRIPTION: Creates a white rectangular region at (278, 10) spanning 105 by 30 pixels.
; PLAN: r0=278(x), r1=10(y), r2=105(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 10
LDI r2, 105
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
