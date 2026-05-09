; DESCRIPTION: Creates a black rectangular region at (144, 141) spanning 114 by 100 pixels.
; PLAN: r0=144(x), r1=141(y), r2=114(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 141
LDI r2, 114
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
