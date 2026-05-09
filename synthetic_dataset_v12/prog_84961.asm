; DESCRIPTION: Creates a magenta rectangular region at (324, 83) spanning 13 by 116 pixels.
; PLAN: r0=324(x), r1=83(y), r2=13(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 83
LDI r2, 13
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
