; DESCRIPTION: Creates a red rectangular region at (14, 95) spanning 47 by 116 pixels.
; PLAN: r0=14(x), r1=95(y), r2=47(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 95
LDI r2, 47
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
