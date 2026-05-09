; DESCRIPTION: Creates a purple rectangular region at (157, 43) spanning 46 by 107 pixels.
; PLAN: r0=157(x), r1=43(y), r2=46(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 43
LDI r2, 46
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
