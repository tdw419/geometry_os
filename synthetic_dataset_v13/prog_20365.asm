; DESCRIPTION: Creates a magenta rectangular region at (56, 39) spanning 105 by 30 pixels.
; PLAN: r0=56(x), r1=39(y), r2=105(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 39
LDI r2, 105
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
