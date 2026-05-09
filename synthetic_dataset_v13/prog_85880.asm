; DESCRIPTION: Creates a magenta rectangular region at (88, 21) spanning 59 by 108 pixels.
; PLAN: r0=88(x), r1=21(y), r2=59(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 21
LDI r2, 59
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
