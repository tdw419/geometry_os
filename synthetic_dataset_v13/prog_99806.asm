; DESCRIPTION: Creates a black rectangular region at (165, 78) spanning 71 by 109 pixels.
; PLAN: r0=165(x), r1=78(y), r2=71(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 78
LDI r2, 71
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
