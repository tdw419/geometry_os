; DESCRIPTION: Creates a black rectangular region at (360, 123) spanning 11 by 95 pixels.
; PLAN: r0=360(x), r1=123(y), r2=11(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 123
LDI r2, 11
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
