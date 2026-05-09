; DESCRIPTION: Creates a black rectangular region at (258, 75) spanning 115 by 21 pixels.
; PLAN: r0=258(x), r1=75(y), r2=115(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 75
LDI r2, 115
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
