; DESCRIPTION: Creates a red rectangular region at (391, 143) spanning 43 by 90 pixels.
; PLAN: r0=391(x), r1=143(y), r2=43(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 143
LDI r2, 43
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
