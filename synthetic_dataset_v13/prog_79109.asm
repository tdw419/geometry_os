; DESCRIPTION: Creates a black rectangular region at (117, 200) spanning 65 by 35 pixels.
; PLAN: r0=117(x), r1=200(y), r2=65(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 200
LDI r2, 65
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
