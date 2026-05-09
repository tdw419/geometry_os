; DESCRIPTION: Creates a black rectangular region at (134, 44) spanning 96 by 19 pixels.
; PLAN: r0=134(x), r1=44(y), r2=96(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 44
LDI r2, 96
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
