; DESCRIPTION: Creates a black rectangular region at (344, 55) spanning 13 by 94 pixels.
; PLAN: r0=344(x), r1=55(y), r2=13(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 55
LDI r2, 13
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
