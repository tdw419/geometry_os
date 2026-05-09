; DESCRIPTION: Creates a magenta rectangular region at (401, 86) spanning 53 by 99 pixels.
; PLAN: r0=401(x), r1=86(y), r2=53(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 86
LDI r2, 53
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
