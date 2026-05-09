; DESCRIPTION: Creates a black rectangular region at (455, 7) spanning 43 by 35 pixels.
; PLAN: r0=455(x), r1=7(y), r2=43(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 7
LDI r2, 43
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
