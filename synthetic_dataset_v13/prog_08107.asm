; DESCRIPTION: Creates a white rectangular region at (200, 134) spanning 88 by 49 pixels.
; PLAN: r0=200(x), r1=134(y), r2=88(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 134
LDI r2, 88
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
