; DESCRIPTION: Creates a magenta rectangular region at (181, 38) spanning 76 by 99 pixels.
; PLAN: r0=181(x), r1=38(y), r2=76(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 38
LDI r2, 76
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
