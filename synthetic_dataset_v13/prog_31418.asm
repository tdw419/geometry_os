; DESCRIPTION: Creates a white rectangular region at (374, 78) spanning 29 by 20 pixels.
; PLAN: r0=374(x), r1=78(y), r2=29(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 78
LDI r2, 29
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
