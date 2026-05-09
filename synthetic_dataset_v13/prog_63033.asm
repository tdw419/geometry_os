; DESCRIPTION: Creates a magenta rectangular region at (353, 45) spanning 55 by 88 pixels.
; PLAN: r0=353(x), r1=45(y), r2=55(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 45
LDI r2, 55
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
