; DESCRIPTION: Creates a red rectangular region at (67, 134) spanning 11 by 57 pixels.
; PLAN: r0=67(x), r1=134(y), r2=11(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 134
LDI r2, 11
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
