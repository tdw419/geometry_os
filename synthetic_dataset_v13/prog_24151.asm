; DESCRIPTION: Creates a magenta rectangular region at (412, 15) spanning 49 by 24 pixels.
; PLAN: r0=412(x), r1=15(y), r2=49(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 15
LDI r2, 49
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
