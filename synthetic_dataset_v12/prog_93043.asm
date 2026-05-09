; DESCRIPTION: Creates a black rectangular region at (100, 75) spanning 28 by 18 pixels.
; PLAN: r0=100(x), r1=75(y), r2=28(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 75
LDI r2, 28
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
