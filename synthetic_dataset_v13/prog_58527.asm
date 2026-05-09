; DESCRIPTION: Creates a red rectangular region at (116, 114) spanning 105 by 38 pixels.
; PLAN: r0=116(x), r1=114(y), r2=105(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 114
LDI r2, 105
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
