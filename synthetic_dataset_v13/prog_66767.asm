; DESCRIPTION: Creates a black rectangular region at (32, 121) spanning 46 by 114 pixels.
; PLAN: r0=32(x), r1=121(y), r2=46(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 121
LDI r2, 46
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
