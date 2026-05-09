; DESCRIPTION: Creates a magenta rectangular region at (88, 165) spanning 90 by 51 pixels.
; PLAN: r0=88(x), r1=165(y), r2=90(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 165
LDI r2, 90
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
