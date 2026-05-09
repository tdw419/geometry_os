; DESCRIPTION: Creates a black rectangular region at (51, 86) spanning 115 by 86 pixels.
; PLAN: r0=51(x), r1=86(y), r2=115(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 86
LDI r2, 115
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
