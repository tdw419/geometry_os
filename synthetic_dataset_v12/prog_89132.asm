; DESCRIPTION: Creates a black rectangular region at (309, 135) spanning 82 by 66 pixels.
; PLAN: r0=309(x), r1=135(y), r2=82(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 135
LDI r2, 82
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
