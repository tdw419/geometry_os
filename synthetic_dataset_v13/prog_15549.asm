; DESCRIPTION: Creates a black rectangular region at (370, 51) spanning 19 by 116 pixels.
; PLAN: r0=370(x), r1=51(y), r2=19(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 51
LDI r2, 19
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
