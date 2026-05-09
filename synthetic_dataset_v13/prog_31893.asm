; DESCRIPTION: Creates a black rectangular region at (424, 195) spanning 49 by 35 pixels.
; PLAN: r0=424(x), r1=195(y), r2=49(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 195
LDI r2, 49
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
