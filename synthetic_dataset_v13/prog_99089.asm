; DESCRIPTION: Creates a magenta rectangular region at (212, 216) spanning 32 by 35 pixels.
; PLAN: r0=212(x), r1=216(y), r2=32(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 216
LDI r2, 32
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
