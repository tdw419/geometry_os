; DESCRIPTION: Creates a magenta rectangular region at (116, 32) spanning 76 by 52 pixels.
; PLAN: r0=116(x), r1=32(y), r2=76(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 32
LDI r2, 76
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
