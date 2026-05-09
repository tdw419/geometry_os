; DESCRIPTION: Creates a magenta rectangular region at (103, 0) spanning 94 by 92 pixels.
; PLAN: r0=103(x), r1=0(y), r2=94(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 0
LDI r2, 94
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
