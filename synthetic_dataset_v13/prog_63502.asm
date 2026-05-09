; DESCRIPTION: Creates a magenta rectangular region at (49, 94) spanning 16 by 49 pixels.
; PLAN: r0=49(x), r1=94(y), r2=16(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 94
LDI r2, 16
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
