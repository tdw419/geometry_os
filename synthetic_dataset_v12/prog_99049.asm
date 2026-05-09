; DESCRIPTION: Creates a white rectangular region at (485, 142) spanning 11 by 40 pixels.
; PLAN: r0=485(x), r1=142(y), r2=11(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 142
LDI r2, 11
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
