; DESCRIPTION: Creates a white rectangular region at (291, 36) spanning 105 by 19 pixels.
; PLAN: r0=291(x), r1=36(y), r2=105(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 36
LDI r2, 105
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
