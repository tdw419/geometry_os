; DESCRIPTION: Creates a magenta rectangular region at (42, 53) spanning 92 by 22 pixels.
; PLAN: r0=42(x), r1=53(y), r2=92(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 53
LDI r2, 92
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
