; DESCRIPTION: Creates a magenta rectangular region at (276, 92) spanning 85 by 42 pixels.
; PLAN: r0=276(x), r1=92(y), r2=85(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 92
LDI r2, 85
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
