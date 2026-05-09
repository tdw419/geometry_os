; DESCRIPTION: Creates a black rectangular region at (370, 76) spanning 57 by 23 pixels.
; PLAN: r0=370(x), r1=76(y), r2=57(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 76
LDI r2, 57
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
