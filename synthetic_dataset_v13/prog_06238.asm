; DESCRIPTION: Creates a purple rectangular region at (253, 114) spanning 74 by 23 pixels.
; PLAN: r0=253(x), r1=114(y), r2=74(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 114
LDI r2, 74
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
