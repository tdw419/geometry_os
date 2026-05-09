; DESCRIPTION: Creates a white rectangular region at (279, 155) spanning 14 by 66 pixels.
; PLAN: r0=279(x), r1=155(y), r2=14(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 155
LDI r2, 14
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
