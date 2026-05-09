; DESCRIPTION: Creates a red rectangular region at (165, 42) spanning 88 by 21 pixels.
; PLAN: r0=165(x), r1=42(y), r2=88(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 42
LDI r2, 88
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
