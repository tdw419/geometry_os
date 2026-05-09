; DESCRIPTION: Creates a magenta rectangular region at (212, 32) spanning 40 by 14 pixels.
; PLAN: r0=212(x), r1=32(y), r2=40(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 32
LDI r2, 40
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
