; DESCRIPTION: Creates a red rectangular region at (30, 42) spanning 57 by 19 pixels.
; PLAN: r0=30(x), r1=42(y), r2=57(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 42
LDI r2, 57
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
