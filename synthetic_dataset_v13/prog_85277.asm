; DESCRIPTION: Creates a black rectangular region at (141, 127) spanning 46 by 39 pixels.
; PLAN: r0=141(x), r1=127(y), r2=46(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 127
LDI r2, 46
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
