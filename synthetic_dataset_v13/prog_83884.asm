; DESCRIPTION: Creates a purple rectangular region at (49, 114) spanning 16 by 46 pixels.
; PLAN: r0=49(x), r1=114(y), r2=16(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 114
LDI r2, 16
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
