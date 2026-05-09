; DESCRIPTION: Creates a white rectangular region at (37, 136) spanning 65 by 99 pixels.
; PLAN: r0=37(x), r1=136(y), r2=65(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 136
LDI r2, 65
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
