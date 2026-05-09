; DESCRIPTION: Creates a purple rectangular region at (340, 166) spanning 78 by 35 pixels.
; PLAN: r0=340(x), r1=166(y), r2=78(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 166
LDI r2, 78
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
