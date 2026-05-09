; DESCRIPTION: Creates a white rectangular region at (86, 17) spanning 75 by 119 pixels.
; PLAN: r0=86(x), r1=17(y), r2=75(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 17
LDI r2, 75
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
