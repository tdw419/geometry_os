; DESCRIPTION: Creates a magenta rectangular region at (261, 90) spanning 37 by 39 pixels.
; PLAN: r0=261(x), r1=90(y), r2=37(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 90
LDI r2, 37
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
