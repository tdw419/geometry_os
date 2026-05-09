; DESCRIPTION: Creates a white rectangular region at (119, 213) spanning 118 by 14 pixels.
; PLAN: r0=119(x), r1=213(y), r2=118(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 213
LDI r2, 118
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
