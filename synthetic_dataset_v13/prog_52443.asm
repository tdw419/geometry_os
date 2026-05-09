; DESCRIPTION: Creates a black rectangular region at (346, 15) spanning 47 by 53 pixels.
; PLAN: r0=346(x), r1=15(y), r2=47(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 15
LDI r2, 47
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
