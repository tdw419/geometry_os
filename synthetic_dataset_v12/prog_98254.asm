; DESCRIPTION: Creates a magenta rectangular region at (21, 9) spanning 88 by 90 pixels.
; PLAN: r0=21(x), r1=9(y), r2=88(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 9
LDI r2, 88
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
