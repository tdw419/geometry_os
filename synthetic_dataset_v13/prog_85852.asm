; DESCRIPTION: Creates a red rectangular region at (47, 167) spanning 74 by 61 pixels.
; PLAN: r0=47(x), r1=167(y), r2=74(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 167
LDI r2, 74
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
