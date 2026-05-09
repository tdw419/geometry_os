; DESCRIPTION: Creates a magenta rectangular region at (244, 228) spanning 15 by 23 pixels.
; PLAN: r0=244(x), r1=228(y), r2=15(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 228
LDI r2, 15
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
