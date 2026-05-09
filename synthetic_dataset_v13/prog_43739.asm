; DESCRIPTION: Creates a magenta rectangular region at (209, 170) spanning 82 by 80 pixels.
; PLAN: r0=209(x), r1=170(y), r2=82(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 170
LDI r2, 82
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
