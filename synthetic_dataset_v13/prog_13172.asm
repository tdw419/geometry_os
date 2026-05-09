; DESCRIPTION: Creates a red rectangular region at (74, 24) spanning 19 by 29 pixels.
; PLAN: r0=74(x), r1=24(y), r2=19(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 24
LDI r2, 19
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
