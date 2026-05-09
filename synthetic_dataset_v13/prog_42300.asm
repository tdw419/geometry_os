; DESCRIPTION: Creates a magenta rectangular region at (65, 88) spanning 113 by 14 pixels.
; PLAN: r0=65(x), r1=88(y), r2=113(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 88
LDI r2, 113
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
