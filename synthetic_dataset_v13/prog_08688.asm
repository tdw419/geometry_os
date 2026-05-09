; DESCRIPTION: Creates a black rectangular region at (442, 85) spanning 49 by 84 pixels.
; PLAN: r0=442(x), r1=85(y), r2=49(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 85
LDI r2, 49
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
