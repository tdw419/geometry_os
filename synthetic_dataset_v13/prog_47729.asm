; DESCRIPTION: Creates a magenta rectangular region at (72, 85) spanning 45 by 88 pixels.
; PLAN: r0=72(x), r1=85(y), r2=45(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 85
LDI r2, 45
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
