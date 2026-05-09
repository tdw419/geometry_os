; DESCRIPTION: Creates a magenta rectangular region at (122, 118) spanning 51 by 49 pixels.
; PLAN: r0=122(x), r1=118(y), r2=51(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 118
LDI r2, 51
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
