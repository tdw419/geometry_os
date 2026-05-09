; DESCRIPTION: Creates a magenta rectangular region at (232, 33) spanning 26 by 40 pixels.
; PLAN: r0=232(x), r1=33(y), r2=26(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 33
LDI r2, 26
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
