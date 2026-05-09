; DESCRIPTION: Creates a red rectangular region at (42, 90) spanning 116 by 62 pixels.
; PLAN: r0=42(x), r1=90(y), r2=116(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 90
LDI r2, 116
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
