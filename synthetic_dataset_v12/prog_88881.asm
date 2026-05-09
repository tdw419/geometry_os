; DESCRIPTION: Creates a black rectangular region at (354, 167) spanning 41 by 61 pixels.
; PLAN: r0=354(x), r1=167(y), r2=41(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 167
LDI r2, 41
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
