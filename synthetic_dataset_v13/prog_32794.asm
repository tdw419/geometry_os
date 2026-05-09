; DESCRIPTION: Creates a magenta rectangular region at (166, 230) spanning 88 by 11 pixels.
; PLAN: r0=166(x), r1=230(y), r2=88(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 230
LDI r2, 88
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
