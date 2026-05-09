; DESCRIPTION: Creates a black rectangular region at (357, 98) spanning 49 by 107 pixels.
; PLAN: r0=357(x), r1=98(y), r2=49(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 98
LDI r2, 49
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
