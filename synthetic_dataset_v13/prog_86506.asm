; DESCRIPTION: Creates a magenta rectangular region at (232, 111) spanning 13 by 19 pixels.
; PLAN: r0=232(x), r1=111(y), r2=13(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 111
LDI r2, 13
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
