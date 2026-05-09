; DESCRIPTION: Creates a magenta rectangular region at (402, 23) spanning 38 by 82 pixels.
; PLAN: r0=402(x), r1=23(y), r2=38(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 23
LDI r2, 38
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
