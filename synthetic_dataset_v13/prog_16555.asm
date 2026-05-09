; DESCRIPTION: Creates a white rectangular region at (118, 18) spanning 43 by 17 pixels.
; PLAN: r0=118(x), r1=18(y), r2=43(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 18
LDI r2, 43
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
