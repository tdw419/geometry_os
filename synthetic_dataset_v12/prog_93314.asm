; DESCRIPTION: Creates a magenta rectangular region at (279, 45) spanning 22 by 101 pixels.
; PLAN: r0=279(x), r1=45(y), r2=22(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 45
LDI r2, 22
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
