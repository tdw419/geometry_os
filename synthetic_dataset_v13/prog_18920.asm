; DESCRIPTION: Creates a red rectangular region at (222, 123) spanning 82 by 115 pixels.
; PLAN: r0=222(x), r1=123(y), r2=82(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 123
LDI r2, 82
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
