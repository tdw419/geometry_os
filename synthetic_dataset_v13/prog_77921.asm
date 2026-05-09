; DESCRIPTION: Creates a black rectangular region at (309, 139) spanning 20 by 83 pixels.
; PLAN: r0=309(x), r1=139(y), r2=20(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 139
LDI r2, 20
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
