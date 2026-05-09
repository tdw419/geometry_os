; DESCRIPTION: Creates a black rectangular region at (5, 78) spanning 10 by 96 pixels.
; PLAN: r0=5(x), r1=78(y), r2=10(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 78
LDI r2, 10
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
