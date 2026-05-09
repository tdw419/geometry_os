; DESCRIPTION: Creates a magenta rectangular region at (416, 12) spanning 92 by 23 pixels.
; PLAN: r0=416(x), r1=12(y), r2=92(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 12
LDI r2, 92
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
