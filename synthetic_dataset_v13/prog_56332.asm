; DESCRIPTION: Creates a red rectangular region at (391, 102) spanning 16 by 43 pixels.
; PLAN: r0=391(x), r1=102(y), r2=16(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 102
LDI r2, 16
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
