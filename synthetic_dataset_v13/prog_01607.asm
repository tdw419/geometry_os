; DESCRIPTION: Creates a white rectangular region at (212, 166) spanning 51 by 88 pixels.
; PLAN: r0=212(x), r1=166(y), r2=51(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 166
LDI r2, 51
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
