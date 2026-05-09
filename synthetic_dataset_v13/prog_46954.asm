; DESCRIPTION: Creates a black rectangular region at (276, 0) spanning 71 by 107 pixels.
; PLAN: r0=276(x), r1=0(y), r2=71(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 0
LDI r2, 71
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
