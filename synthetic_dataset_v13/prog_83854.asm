; DESCRIPTION: Creates a purple rectangular region at (286, 135) spanning 102 by 46 pixels.
; PLAN: r0=286(x), r1=135(y), r2=102(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 135
LDI r2, 102
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
