; DESCRIPTION: Creates a purple rectangular region at (473, 130) spanning 25 by 117 pixels.
; PLAN: r0=473(x), r1=130(y), r2=25(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 130
LDI r2, 25
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
