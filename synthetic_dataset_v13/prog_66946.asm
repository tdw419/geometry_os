; DESCRIPTION: Creates a magenta rectangular region at (244, 56) spanning 85 by 61 pixels.
; PLAN: r0=244(x), r1=56(y), r2=85(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 56
LDI r2, 85
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
