; DESCRIPTION: Creates a magenta rectangular region at (163, 153) spanning 49 by 24 pixels.
; PLAN: r0=163(x), r1=153(y), r2=49(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 153
LDI r2, 49
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
