; DESCRIPTION: Creates a black rectangular region at (285, 49) spanning 75 by 70 pixels.
; PLAN: r0=285(x), r1=49(y), r2=75(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 49
LDI r2, 75
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
