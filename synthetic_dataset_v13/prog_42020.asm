; DESCRIPTION: Creates a white rectangular region at (232, 66) spanning 59 by 94 pixels.
; PLAN: r0=232(x), r1=66(y), r2=59(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 66
LDI r2, 59
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
