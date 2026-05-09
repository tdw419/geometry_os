; DESCRIPTION: Creates a black rectangular region at (211, 158) spanning 115 by 86 pixels.
; PLAN: r0=211(x), r1=158(y), r2=115(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 158
LDI r2, 115
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
