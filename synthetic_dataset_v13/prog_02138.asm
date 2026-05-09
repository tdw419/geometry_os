; DESCRIPTION: Creates a black rectangular region at (30, 37) spanning 49 by 49 pixels.
; PLAN: r0=30(x), r1=37(y), r2=49(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 37
LDI r2, 49
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
