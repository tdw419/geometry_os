; DESCRIPTION: Creates a magenta rectangular region at (275, 10) spanning 88 by 108 pixels.
; PLAN: r0=275(x), r1=10(y), r2=88(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 10
LDI r2, 88
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
