; DESCRIPTION: Creates a magenta rectangular region at (207, 101) spanning 99 by 90 pixels.
; PLAN: r0=207(x), r1=101(y), r2=99(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 101
LDI r2, 99
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
