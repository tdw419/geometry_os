; DESCRIPTION: Creates a magenta rectangular region at (304, 19) spanning 74 by 116 pixels.
; PLAN: r0=304(x), r1=19(y), r2=74(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 19
LDI r2, 74
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
