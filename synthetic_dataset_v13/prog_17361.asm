; DESCRIPTION: Creates a magenta rectangular region at (131, 32) spanning 96 by 92 pixels.
; PLAN: r0=131(x), r1=32(y), r2=96(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 32
LDI r2, 96
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
