; DESCRIPTION: Creates a magenta rectangular region at (176, 68) spanning 37 by 73 pixels.
; PLAN: r0=176(x), r1=68(y), r2=37(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 68
LDI r2, 37
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
