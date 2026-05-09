; DESCRIPTION: Creates a purple rectangular region at (375, 196) spanning 102 by 19 pixels.
; PLAN: r0=375(x), r1=196(y), r2=102(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 196
LDI r2, 102
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
