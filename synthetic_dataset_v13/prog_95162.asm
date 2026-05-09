; DESCRIPTION: Creates a red rectangular region at (424, 127) spanning 43 by 53 pixels.
; PLAN: r0=424(x), r1=127(y), r2=43(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 127
LDI r2, 43
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
