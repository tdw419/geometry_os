; DESCRIPTION: Creates a white rectangular region at (84, 66) spanning 65 by 78 pixels.
; PLAN: r0=84(x), r1=66(y), r2=65(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 66
LDI r2, 65
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
