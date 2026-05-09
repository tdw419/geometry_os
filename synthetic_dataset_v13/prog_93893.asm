; DESCRIPTION: Creates a black rectangular region at (317, 39) spanning 88 by 83 pixels.
; PLAN: r0=317(x), r1=39(y), r2=88(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 39
LDI r2, 88
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
