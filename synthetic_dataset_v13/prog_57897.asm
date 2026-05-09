; DESCRIPTION: Creates a purple rectangular region at (364, 165) spanning 22 by 24 pixels.
; PLAN: r0=364(x), r1=165(y), r2=22(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 165
LDI r2, 22
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
