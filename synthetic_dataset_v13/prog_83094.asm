; DESCRIPTION: Creates a red rectangular region at (119, 7) spanning 78 by 113 pixels.
; PLAN: r0=119(x), r1=7(y), r2=78(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 7
LDI r2, 78
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
