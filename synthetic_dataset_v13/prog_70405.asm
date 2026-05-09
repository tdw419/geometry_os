; DESCRIPTION: Creates a black rectangular region at (16, 114) spanning 34 by 49 pixels.
; PLAN: r0=16(x), r1=114(y), r2=34(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 114
LDI r2, 34
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
