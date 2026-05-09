; DESCRIPTION: Creates a black rectangular region at (91, 28) spanning 84 by 40 pixels.
; PLAN: r0=91(x), r1=28(y), r2=84(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 28
LDI r2, 84
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
