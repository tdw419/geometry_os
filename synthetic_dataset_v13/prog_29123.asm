; DESCRIPTION: Creates a red rectangular region at (413, 27) spanning 78 by 116 pixels.
; PLAN: r0=413(x), r1=27(y), r2=78(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 27
LDI r2, 78
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
