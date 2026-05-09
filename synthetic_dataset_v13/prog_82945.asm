; DESCRIPTION: Creates a black rectangular region at (462, 128) spanning 37 by 69 pixels.
; PLAN: r0=462(x), r1=128(y), r2=37(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 128
LDI r2, 37
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
