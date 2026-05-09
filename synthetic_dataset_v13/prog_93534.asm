; DESCRIPTION: Creates a black rectangular region at (17, 86) spanning 51 by 96 pixels.
; PLAN: r0=17(x), r1=86(y), r2=51(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 86
LDI r2, 51
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
