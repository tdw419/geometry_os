; DESCRIPTION: Creates a black rectangular region at (79, 3) spanning 83 by 62 pixels.
; PLAN: r0=79(x), r1=3(y), r2=83(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 3
LDI r2, 83
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
