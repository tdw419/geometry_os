; DESCRIPTION: Creates a red rectangular region at (182, 101) spanning 38 by 74 pixels.
; PLAN: r0=182(x), r1=101(y), r2=38(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 101
LDI r2, 38
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
