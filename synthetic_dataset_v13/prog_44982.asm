; DESCRIPTION: Creates a white rectangular region at (359, 130) spanning 88 by 115 pixels.
; PLAN: r0=359(x), r1=130(y), r2=88(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 130
LDI r2, 88
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
