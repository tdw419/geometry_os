; DESCRIPTION: Creates a magenta rectangular region at (452, 158) spanning 47 by 42 pixels.
; PLAN: r0=452(x), r1=158(y), r2=47(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 158
LDI r2, 47
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
