; DESCRIPTION: Creates a white rectangular region at (76, 130) spanning 110 by 74 pixels.
; PLAN: r0=76(x), r1=130(y), r2=110(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 130
LDI r2, 110
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
