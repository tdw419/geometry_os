; DESCRIPTION: Creates a black rectangular region at (378, 166) spanning 72 by 89 pixels.
; PLAN: r0=378(x), r1=166(y), r2=72(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 166
LDI r2, 72
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
