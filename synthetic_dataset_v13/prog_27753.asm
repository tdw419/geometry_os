; DESCRIPTION: Creates a magenta rectangular region at (376, 123) spanning 25 by 61 pixels.
; PLAN: r0=376(x), r1=123(y), r2=25(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 123
LDI r2, 25
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
