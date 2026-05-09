; DESCRIPTION: Creates a black rectangular region at (267, 35) spanning 19 by 72 pixels.
; PLAN: r0=267(x), r1=35(y), r2=19(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 35
LDI r2, 19
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
