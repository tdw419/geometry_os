; DESCRIPTION: Creates a black rectangular region at (54, 140) spanning 56 by 84 pixels.
; PLAN: r0=54(x), r1=140(y), r2=56(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 140
LDI r2, 56
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
