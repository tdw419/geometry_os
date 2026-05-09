; DESCRIPTION: Creates a black rectangular region at (182, 156) spanning 58 by 88 pixels.
; PLAN: r0=182(x), r1=156(y), r2=58(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 156
LDI r2, 58
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
