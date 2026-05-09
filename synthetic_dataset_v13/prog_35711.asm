; DESCRIPTION: Creates a magenta rectangular region at (74, 7) spanning 92 by 19 pixels.
; PLAN: r0=74(x), r1=7(y), r2=92(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 7
LDI r2, 92
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
