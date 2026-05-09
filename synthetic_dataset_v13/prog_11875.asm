; DESCRIPTION: Creates a black rectangular region at (46, 165) spanning 114 by 73 pixels.
; PLAN: r0=46(x), r1=165(y), r2=114(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 165
LDI r2, 114
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
