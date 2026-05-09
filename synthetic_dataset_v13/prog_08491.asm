; DESCRIPTION: Creates a black rectangular region at (50, 86) spanning 76 by 110 pixels.
; PLAN: r0=50(x), r1=86(y), r2=76(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 86
LDI r2, 76
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
