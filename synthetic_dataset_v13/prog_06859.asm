; DESCRIPTION: Creates a black rectangular region at (91, 175) spanning 84 by 63 pixels.
; PLAN: r0=91(x), r1=175(y), r2=84(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 175
LDI r2, 84
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
