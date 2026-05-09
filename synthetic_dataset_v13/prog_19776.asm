; DESCRIPTION: Creates a black rectangular region at (135, 58) spanning 99 by 46 pixels.
; PLAN: r0=135(x), r1=58(y), r2=99(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 58
LDI r2, 99
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
