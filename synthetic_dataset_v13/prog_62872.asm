; DESCRIPTION: Creates a black rectangular region at (237, 115) spanning 78 by 46 pixels.
; PLAN: r0=237(x), r1=115(y), r2=78(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 115
LDI r2, 78
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
