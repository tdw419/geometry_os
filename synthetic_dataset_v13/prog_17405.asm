; DESCRIPTION: Creates a black rectangular region at (279, 122) spanning 111 by 112 pixels.
; PLAN: r0=279(x), r1=122(y), r2=111(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 122
LDI r2, 111
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
