; DESCRIPTION: Creates a yellow rectangular region at (7, 36) spanning 43 by 51 pixels.
; PLAN: r0=7(x), r1=36(y), r2=43(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 36
LDI r2, 43
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
