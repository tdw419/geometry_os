; DESCRIPTION: Creates a magenta rectangular region at (216, 51) spanning 17 by 12 pixels.
; PLAN: r0=216(x), r1=51(y), r2=17(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 51
LDI r2, 17
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
