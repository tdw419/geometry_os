; DESCRIPTION: Creates a black rectangular region at (181, 105) spanning 37 by 61 pixels.
; PLAN: r0=181(x), r1=105(y), r2=37(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 105
LDI r2, 37
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
