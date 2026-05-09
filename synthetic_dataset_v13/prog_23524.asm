; DESCRIPTION: Creates a red rectangular region at (378, 190) spanning 110 by 43 pixels.
; PLAN: r0=378(x), r1=190(y), r2=110(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 190
LDI r2, 110
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
