; DESCRIPTION: Creates a black rectangular region at (306, 198) spanning 60 by 12 pixels.
; PLAN: r0=306(x), r1=198(y), r2=60(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 198
LDI r2, 60
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
