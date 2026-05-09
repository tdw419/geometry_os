; DESCRIPTION: Creates a magenta rectangular region at (128, 170) spanning 117 by 43 pixels.
; PLAN: r0=128(x), r1=170(y), r2=117(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 170
LDI r2, 117
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
