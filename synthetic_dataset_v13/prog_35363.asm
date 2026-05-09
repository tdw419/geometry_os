; DESCRIPTION: Creates a white rectangular region at (105, 86) spanning 118 by 78 pixels.
; PLAN: r0=105(x), r1=86(y), r2=118(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 86
LDI r2, 118
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
