; DESCRIPTION: Creates a red rectangular region at (353, 12) spanning 42 by 95 pixels.
; PLAN: r0=353(x), r1=12(y), r2=42(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 12
LDI r2, 42
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
