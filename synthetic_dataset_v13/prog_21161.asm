; DESCRIPTION: Creates a black rectangular region at (19, 115) spanning 74 by 82 pixels.
; PLAN: r0=19(x), r1=115(y), r2=74(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 115
LDI r2, 74
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
