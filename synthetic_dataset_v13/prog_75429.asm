; DESCRIPTION: Creates a white rectangular region at (20, 49) spanning 86 by 76 pixels.
; PLAN: r0=20(x), r1=49(y), r2=86(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 49
LDI r2, 86
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
