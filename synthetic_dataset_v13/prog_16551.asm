; DESCRIPTION: Creates a yellow rectangular region at (230, 166) spanning 51 by 49 pixels.
; PLAN: r0=230(x), r1=166(y), r2=51(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 166
LDI r2, 51
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
