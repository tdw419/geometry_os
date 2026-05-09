; DESCRIPTION: Creates a yellow rectangular region at (204, 43) spanning 29 by 51 pixels.
; PLAN: r0=204(x), r1=43(y), r2=29(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 43
LDI r2, 29
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
