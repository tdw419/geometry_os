; DESCRIPTION: Creates a white rectangular region at (313, 16) spanning 84 by 17 pixels.
; PLAN: r0=313(x), r1=16(y), r2=84(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 16
LDI r2, 84
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
