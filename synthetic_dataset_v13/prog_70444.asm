; DESCRIPTION: Creates a magenta rectangular region at (333, 88) spanning 15 by 22 pixels.
; PLAN: r0=333(x), r1=88(y), r2=15(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 88
LDI r2, 15
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
