; DESCRIPTION: Creates a magenta rectangular region at (327, 31) spanning 68 by 101 pixels.
; PLAN: r0=327(x), r1=31(y), r2=68(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 31
LDI r2, 68
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
