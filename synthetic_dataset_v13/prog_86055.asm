; DESCRIPTION: Creates a black rectangular region at (47, 78) spanning 117 by 64 pixels.
; PLAN: r0=47(x), r1=78(y), r2=117(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 78
LDI r2, 117
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
