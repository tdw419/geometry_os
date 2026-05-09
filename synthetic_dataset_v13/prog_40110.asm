; DESCRIPTION: Creates a magenta rectangular region at (64, 2) spanning 92 by 101 pixels.
; PLAN: r0=64(x), r1=2(y), r2=92(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 2
LDI r2, 92
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
