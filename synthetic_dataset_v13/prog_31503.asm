; DESCRIPTION: Creates a white rectangular region at (175, 12) spanning 84 by 59 pixels.
; PLAN: r0=175(x), r1=12(y), r2=84(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 12
LDI r2, 84
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
