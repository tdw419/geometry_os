; DESCRIPTION: Creates a white rectangular region at (435, 98) spanning 56 by 49 pixels.
; PLAN: r0=435(x), r1=98(y), r2=56(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 98
LDI r2, 56
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
