; DESCRIPTION: Creates a black rectangular region at (60, 165) spanning 119 by 43 pixels.
; PLAN: r0=60(x), r1=165(y), r2=119(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 165
LDI r2, 119
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
