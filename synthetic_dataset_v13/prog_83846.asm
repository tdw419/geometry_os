; DESCRIPTION: Creates a black rectangular region at (39, 84) spanning 64 by 114 pixels.
; PLAN: r0=39(x), r1=84(y), r2=64(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 84
LDI r2, 64
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
