; DESCRIPTION: Creates a magenta rectangular region at (105, 7) spanning 14 by 43 pixels.
; PLAN: r0=105(x), r1=7(y), r2=14(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 7
LDI r2, 14
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
