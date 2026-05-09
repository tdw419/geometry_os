; DESCRIPTION: Creates a magenta rectangular region at (203, 122) spanning 27 by 92 pixels.
; PLAN: r0=203(x), r1=122(y), r2=27(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 122
LDI r2, 27
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
