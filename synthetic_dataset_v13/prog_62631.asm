; DESCRIPTION: Creates a magenta rectangular region at (166, 164) spanning 119 by 88 pixels.
; PLAN: r0=166(x), r1=164(y), r2=119(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 164
LDI r2, 119
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
