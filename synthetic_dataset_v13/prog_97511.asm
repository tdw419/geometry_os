; DESCRIPTION: Creates a black rectangular region at (372, 3) spanning 73 by 46 pixels.
; PLAN: r0=372(x), r1=3(y), r2=73(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 3
LDI r2, 73
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
