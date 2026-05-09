; DESCRIPTION: Creates a magenta rectangular region at (136, 51) spanning 92 by 34 pixels.
; PLAN: r0=136(x), r1=51(y), r2=92(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 51
LDI r2, 92
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
