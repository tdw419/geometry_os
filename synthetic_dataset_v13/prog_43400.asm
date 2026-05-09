; DESCRIPTION: Creates a black rectangular region at (361, 138) spanning 71 by 66 pixels.
; PLAN: r0=361(x), r1=138(y), r2=71(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 138
LDI r2, 71
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
