; DESCRIPTION: Creates a red rectangular region at (276, 122) spanning 94 by 82 pixels.
; PLAN: r0=276(x), r1=122(y), r2=94(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 122
LDI r2, 94
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
