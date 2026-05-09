; DESCRIPTION: Creates a magenta rectangular region at (388, 24) spanning 13 by 95 pixels.
; PLAN: r0=388(x), r1=24(y), r2=13(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 24
LDI r2, 13
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
