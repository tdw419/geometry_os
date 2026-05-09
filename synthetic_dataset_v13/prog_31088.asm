; DESCRIPTION: Creates a purple rectangular region at (127, 0) spanning 26 by 62 pixels.
; PLAN: r0=127(x), r1=0(y), r2=26(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 0
LDI r2, 26
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
