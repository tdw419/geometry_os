; DESCRIPTION: Creates a black rectangular region at (78, 140) spanning 65 by 18 pixels.
; PLAN: r0=78(x), r1=140(y), r2=65(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 140
LDI r2, 65
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
