; DESCRIPTION: Creates a magenta rectangular region at (376, 108) spanning 14 by 51 pixels.
; PLAN: r0=376(x), r1=108(y), r2=14(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 108
LDI r2, 14
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
