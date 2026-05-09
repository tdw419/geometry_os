; DESCRIPTION: Creates a magenta rectangular region at (3, 62) spanning 90 by 42 pixels.
; PLAN: r0=3(x), r1=62(y), r2=90(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 62
LDI r2, 90
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
