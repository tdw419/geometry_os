; DESCRIPTION: Creates a purple rectangular region at (130, 43) spanning 72 by 101 pixels.
; PLAN: r0=130(x), r1=43(y), r2=72(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 43
LDI r2, 72
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
