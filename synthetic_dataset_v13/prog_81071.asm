; DESCRIPTION: Creates a red rectangular region at (378, 14) spanning 43 by 116 pixels.
; PLAN: r0=378(x), r1=14(y), r2=43(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 14
LDI r2, 43
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
