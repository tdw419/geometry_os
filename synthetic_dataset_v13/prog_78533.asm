; DESCRIPTION: Creates a black rectangular region at (460, 170) spanning 39 by 69 pixels.
; PLAN: r0=460(x), r1=170(y), r2=39(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 170
LDI r2, 39
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
