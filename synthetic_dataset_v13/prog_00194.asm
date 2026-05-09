; DESCRIPTION: Creates a black rectangular region at (451, 175) spanning 39 by 50 pixels.
; PLAN: r0=451(x), r1=175(y), r2=39(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 175
LDI r2, 39
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
