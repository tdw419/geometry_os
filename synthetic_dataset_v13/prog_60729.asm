; DESCRIPTION: Creates a magenta rectangular region at (310, 138) spanning 51 by 105 pixels.
; PLAN: r0=310(x), r1=138(y), r2=51(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 138
LDI r2, 51
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
