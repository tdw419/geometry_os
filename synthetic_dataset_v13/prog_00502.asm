; DESCRIPTION: Creates a black rectangular region at (4, 50) spanning 62 by 110 pixels.
; PLAN: r0=4(x), r1=50(y), r2=62(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 50
LDI r2, 62
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
