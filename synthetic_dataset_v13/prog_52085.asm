; DESCRIPTION: Creates a magenta rectangular region at (167, 42) spanning 12 by 35 pixels.
; PLAN: r0=167(x), r1=42(y), r2=12(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 42
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
