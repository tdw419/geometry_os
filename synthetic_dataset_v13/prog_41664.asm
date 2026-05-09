; DESCRIPTION: Creates a red rectangular region at (78, 104) spanning 39 by 116 pixels.
; PLAN: r0=78(x), r1=104(y), r2=39(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 104
LDI r2, 39
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
