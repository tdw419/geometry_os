; DESCRIPTION: Creates a magenta rectangular region at (335, 49) spanning 34 by 42 pixels.
; PLAN: r0=335(x), r1=49(y), r2=34(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 49
LDI r2, 34
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
