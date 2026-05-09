; DESCRIPTION: Creates a magenta rectangular region at (376, 136) spanning 89 by 76 pixels.
; PLAN: r0=376(x), r1=136(y), r2=89(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 136
LDI r2, 89
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
