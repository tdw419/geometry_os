; DESCRIPTION: Creates a black rectangular region at (432, 108) spanning 66 by 82 pixels.
; PLAN: r0=432(x), r1=108(y), r2=66(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 108
LDI r2, 66
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
