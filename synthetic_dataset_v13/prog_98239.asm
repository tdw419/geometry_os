; DESCRIPTION: Creates a purple rectangular region at (68, 17) spanning 23 by 112 pixels.
; PLAN: r0=68(x), r1=17(y), r2=23(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 17
LDI r2, 23
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
