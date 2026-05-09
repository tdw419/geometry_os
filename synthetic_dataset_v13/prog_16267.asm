; DESCRIPTION: Creates a black rectangular region at (40, 113) spanning 99 by 84 pixels.
; PLAN: r0=40(x), r1=113(y), r2=99(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 113
LDI r2, 99
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
