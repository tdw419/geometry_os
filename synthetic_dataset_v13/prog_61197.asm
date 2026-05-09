; DESCRIPTION: Creates a black rectangular region at (76, 72) spanning 24 by 113 pixels.
; PLAN: r0=76(x), r1=72(y), r2=24(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 72
LDI r2, 24
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
