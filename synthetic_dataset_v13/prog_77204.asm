; DESCRIPTION: Creates a black rectangular region at (378, 71) spanning 57 by 107 pixels.
; PLAN: r0=378(x), r1=71(y), r2=57(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 71
LDI r2, 57
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
