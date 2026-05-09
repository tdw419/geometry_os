; DESCRIPTION: Creates a black rectangular region at (98, 210) spanning 17 by 39 pixels.
; PLAN: r0=98(x), r1=210(y), r2=17(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 210
LDI r2, 17
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
