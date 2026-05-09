; DESCRIPTION: Creates a magenta rectangular region at (3, 92) spanning 103 by 57 pixels.
; PLAN: r0=3(x), r1=92(y), r2=103(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 92
LDI r2, 103
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
