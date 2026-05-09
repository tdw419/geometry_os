; DESCRIPTION: Creates a magenta rectangular region at (112, 45) spanning 88 by 92 pixels.
; PLAN: r0=112(x), r1=45(y), r2=88(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 45
LDI r2, 88
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
