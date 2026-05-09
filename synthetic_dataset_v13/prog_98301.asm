; DESCRIPTION: Creates a magenta rectangular region at (388, 202) spanning 15 by 26 pixels.
; PLAN: r0=388(x), r1=202(y), r2=15(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 202
LDI r2, 15
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
