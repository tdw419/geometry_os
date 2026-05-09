; DESCRIPTION: Creates a purple rectangular region at (113, 46) spanning 83 by 43 pixels.
; PLAN: r0=113(x), r1=46(y), r2=83(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 83
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
