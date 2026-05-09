; DESCRIPTION: Creates a magenta rectangular region at (42, 105) spanning 117 by 68 pixels.
; PLAN: r0=42(x), r1=105(y), r2=117(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 105
LDI r2, 117
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
