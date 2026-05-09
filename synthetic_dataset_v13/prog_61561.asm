; DESCRIPTION: Creates a black rectangular region at (254, 0) spanning 75 by 28 pixels.
; PLAN: r0=254(x), r1=0(y), r2=75(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 0
LDI r2, 75
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
