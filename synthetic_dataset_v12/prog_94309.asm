; DESCRIPTION: Creates a black rectangular region at (494, 25) spanning 13 by 108 pixels.
; PLAN: r0=494(x), r1=25(y), r2=13(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 25
LDI r2, 13
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
