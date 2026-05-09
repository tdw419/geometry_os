; DESCRIPTION: Creates a red rectangular region at (134, 184) spanning 42 by 11 pixels.
; PLAN: r0=134(x), r1=184(y), r2=42(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 184
LDI r2, 42
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
