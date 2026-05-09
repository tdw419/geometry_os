; DESCRIPTION: Creates a black rectangular region at (78, 233) spanning 105 by 12 pixels.
; PLAN: r0=78(x), r1=233(y), r2=105(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 233
LDI r2, 105
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
